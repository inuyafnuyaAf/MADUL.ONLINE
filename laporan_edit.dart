import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pengaduan/home_page.dart';

class ProductEdit extends StatefulWidget {
  const ProductEdit({super.key, required this.id});

  final String id;

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  late String id_laporan;
  final apiUrl = "http://192.168.183.126/codeigniter4/public/laporan/edit/";
  TextEditingController namaController = TextEditingController();
  TextEditingController pengaduanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    id_laporan = widget.id;
    fetchProducts(id_laporan);
  }

  Future<void> fetchProducts(String data) async {
    final response = await http.get(
        Uri.parse('http://192.168.180.126/codeigniter4/public/laporan/$data'));
    if (response.statusCode == 200) {
      var getPostData = json.decode(response.body);
      setState(() {
        namaController.text = getPostData['nama'];
        pengaduanController.text = getPostData['pengaduan'];
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<void> updatePostRequest() async {
    var map = <String, dynamic>{};
    map['nama'] = namaController.text;
    map['pengaduan'] = pengaduanController.text;
    var response = await http.post(Uri.parse(apiUrl + id_laporan), body: map);

    if (response.statusCode == 200) {
      var getPostData = json.decode(response.body);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Message'),
          content: Text(getPostData['Message']['success']),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                navHomePge();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Message'),
          content: const Text("Failed to create product"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void navHomePge() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: namaController,
              decoration: const InputDecoration(hintText: "Nama"),
            ),
            TextField(
              controller: pengaduanController,
              decoration: const InputDecoration(hintText: "Pengaduan"),
            ),
            ElevatedButton(
              onPressed: updatePostRequest,
              child: const Text("Update Produk"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navHomePge,
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ),
    );
  }
}
