import 'package:flutter/material.dart';
import 'package:pengaduan/products.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:pengaduan/laporan_card.dart';
import 'package:pengaduan/laporan_add.dart';
import 'package:pengaduan/laporan_edit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Products>> fetchProducts() async {
    print('ok');
    print('http://192.168.56.1/codeigniter4/public/laporan');
    final response = await http
        .get(Uri.parse('http://192.168.183.126/codeigniter4/public/laporan'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      var getPostData = json.decode(response.body) as List;
      var listPost = getPostData.map((e) => Products.fromJson(e)).toList();
      return listPost;
    } else {
      throw Exception('Failed to load posts');
    }
  }

  late Future<List<Products>> futurePosts;

  @override
  void initState() {
    super.initState();
    print('masuk');
    futurePosts = fetchProducts();
  }

  void navProductAdd() {
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    // return const SampahAdd();
    // }));
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const ProductAdd();
    }));
  }

  void navProductEdit(String data) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => ProductEdit(id: data)));
  }

  Future<void> delProducts(String data) async {
    final response = await http.delete(Uri.parse(
        'http://192.168.183.126/codeigniter4/public/laporan/delete/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 30,
        backgroundColor: const Color(0XFF81C784),
        title: const Text('LIST LAPORAN'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // const SizedBox(height: 10),
          // _buildSaldoSection(),
          // const SizedBox(height: 20),
          // Container(
          //   decoration: BoxDecoration(
          //     color: const Color(0XFF81C784),
          //     borderRadius: BorderRadius.only(
          //       // bottomLeft: Radius.circular(50),
          //       bottomRight: Radius.circular(30),
          //     ),
          //   ),
          //   height: 30,
          // ),
          // Container(
          //   color: const Color(0XFF81C784),
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          //     decoration: BoxDecoration(
          //       color: Color.fromARGB(255, 248, 249, 255),
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(30),
          //         // topRight: Radius.circular(30),
          //       ),
          //     ),
          //     height: 30,
          //   ),
          // ),
          Container(
            child: Column(
              children: [
                // const SizedBox(height: 10),
                // const SizedBox(height: 10),
                _buildSaldoSection(),
                const SizedBox(height: 20),
              ],
            ),
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            // bottomLeft: Radius.circular(50),
            // bottomRight: Radius.circular(50),
            // ),
            // ),
            // height: 50,
          ),
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FutureBuilder<List<Products>>(
                  future: futurePosts,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        itemBuilder: (context, index) {
                          var post = (snapshot.data as List<Products>)[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProductCard(
                                laporan: Products(
                                    idLaporan: post.idLaporan,
                                    nama: post.nama,
                                    pengaduan: post.pengaduan),
                              ),
                              Row(
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        navProductEdit(post.idLaporan);
                                      },
                                      child: const Icon(Icons.edit))
                                ],
                              ),
                              TextButton(
                                onPressed: () {
                                  delProducts(post.idLaporan);
                                },
                                child: const Icon(Icons.delete),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider();
                        },
                        itemCount: (snapshot.data as List<Products>).length,
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: navProductAdd,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSaldoSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          // BoxShadow(
          //   color: Color(0XFF81C784),
          //   offset: Offset(0, 3),
          //   blurRadius: 5,
          //   spreadRadius: 1,
          // ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [],
      ),
    );
  }
}
