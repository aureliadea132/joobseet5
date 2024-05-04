import 'package:flutter/material.dart';

class MahasiswaList extends StatelessWidget {
  final List<String> namaMahasiswa;
  final List<String> nimMahasiswa;
  final int nomorAbsen;

  MahasiswaList({required this.namaMahasiswa, required this.nimMahasiswa, required this.nomorAbsen});

  @override
  Widget build(BuildContext context) {
    int jumlahMahasiswa = namaMahasiswa.length;

    List<Widget> mahasiswaWidgets = [];

    for (int i = nomorAbsen - 2; i <= nomorAbsen + 2; i++) {
      int index = i % jumlahMahasiswa;
      if (index < 0) {
        index += jumlahMahasiswa;
      }

      String nama = namaMahasiswa[index];
      String nim = nimMahasiswa[index];

      Color backgroundColor =
          i == nomorAbsen ? Color.fromARGB(255, 223, 119, 15) : Color.fromARGB(255, 240, 239, 237); // Perbaiki disini, menggunakan 'i' bukan 'index'

      mahasiswaWidgets.add(Container(
        color: backgroundColor,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama: $nama', style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('NIM: $nim', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: mahasiswaWidgets,
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Mahasiswa List'),
        ),
        body: MahasiswaList(
          namaMahasiswa: ['Anugerah Bagus Pratama', 'Naufal Al Zarah Jahshy', 'Hanif Suranto', 'Linen Alif Nandanto', 'Laeli Nur Rohmah'],
          nimMahasiswa: ['STI202102306', 'STI202102307', 'STI202102323', 'STI202102328', 'STI202102305'],
          nomorAbsen: 1,
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
