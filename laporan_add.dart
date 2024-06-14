import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:pengaduan/home_page.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final apiUrl = "http://192.168.183.126/codeigniter4/public/laporan/create";
  final namaController = TextEditingController();
  final pengaduanController = TextEditingController();

  Future<void> sendPostRequest() async {
    var map = <String, dynamic>{};
    map['nama'] = namaController.text;
    map['pengaduan'] = pengaduanController.text;
    var response = await http.post(Uri.parse(apiUrl), body: map);
    if (response.statusCode == 201) {
      var getPostsData = json.decode(response.body);
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Message'),
          content: Text(getPostsData['message']['success']),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                navHomePage();
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    } else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Message'),
          content: const Text("Failed to create product!"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Ok');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void navHomePage() {
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const HomePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Produk"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: namaController,
              decoration: const InputDecoration(hintText: "Nama Produk"),
            ),
            TextField(
              controller: pengaduanController,
              decoration: const InputDecoration(hintText: "Pengaduan"),
            ),
            ElevatedButton(
              onPressed: sendPostRequest,
              child: const Text("Add Product"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navHomePage,
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ),
    );
  }
}
