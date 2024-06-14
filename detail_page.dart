import 'package:flutter/material.dart';
import 'package:pengaduan/products.dart';

class DetailPage extends StatelessWidget {
  final Products laporan;
  const DetailPage({super.key, required this.laporan});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Laporan'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'id_laporan: ${laporan.idLaporan}',
            ),
            Text(
              'nama : ${laporan.nama}',
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('pengaduan'),
            Text(laporan.pengaduan)
          ],
        ),
      ),
    );
  }
}
