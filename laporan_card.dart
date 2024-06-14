import 'package:flutter/material.dart';
import 'package:pengaduan/products.dart';
import 'package:pengaduan/detail_page.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.laporan});
  final Products laporan;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) {
              return DetailPage(laporan: laporan);
            }),
          ),
        );
      },
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 234, 230, 230)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              laporan.nama,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(laporan.pengaduan)
          ],
        ),
      ),
    );
  }
}
