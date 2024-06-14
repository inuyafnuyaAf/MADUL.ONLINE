import 'package:flutter/material.dart';

void main() {
  runApp(ClickableProfileMenuApp());
}

class ClickableProfileMenuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informasi Pribadi'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality here
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildProfileInfo('Nama panjang', "A'YUN FA'YUNI"),
            _buildProfileInfo('Jenis kelamin', 'Perempuan'),
            _buildProfileInfo('Tempat kelahiran', 'BOJONEGORO'),
            _buildProfileInfo('Tanggal lahir', '20 Januari 2005'),
            _buildProfileInfoDropdown('Agama', 'Islam'),
            _buildProfileInfo('Perguruan Tinggi', 'Universitas Nahdlatul Ulama Sunan Giri'),
            _buildProfileInfo('NIM', '221101080'),
            _buildProfileInfo('Program Studi', 'Teknik Informatika'),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfoDropdown(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 4),
          DropdownButtonFormField<String>(
            value: value,
            items: ['Islam', 'Kristen', 'Hindu', 'Budha']
                .map((label) => DropdownMenuItem(
                      child: Text(label),
                      value: label,
                    ))
                .toList(),
            onChanged: (value) {
              // Handle change here
            },
          ),
        ],
      ),
    );
  }
}
