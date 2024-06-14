class Products {
  String idLaporan;
  String nama;
  String pengaduan;

  Products(
      {required this.idLaporan, required this.nama, required this.pengaduan});

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
        idLaporan: json['id_laporan'],
        nama: json['nama'],
        pengaduan: json['pengaduan']);
  }
}
