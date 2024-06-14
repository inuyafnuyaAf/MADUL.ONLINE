import 'package:flutter/material.dart';

class pengaturanapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Akun & Pengaturan'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add back button functionality here
          },
        ),
      ),
      body: ListView(
        children: [
          _buildSettingsOption(context, 'Bahasa', 'Bahasa Indonesia'),
          _buildSettingsOption(context, 'Usia', '18 - 24'),
          _buildSettingsOption(context, 'Kosongkan ruang', ''),
          _buildSwitchOption('Otomatis beralih ke data seluler',
              'Otomatis beralih ke data seluler ketika Wi-Fi lambat'),
          _buildSwitchOption('Notifikasi', ''),
          _buildSettingsOption(context, 'Akun Saya', ''),
          _buildSettingsOption(context, 'Periksa Pembaruan', 'V4.5.5'),
          _buildSettingsOption(context, 'Tentang', ''),
        ],
      ),
    );
  }

  Widget _buildSettingsOption(
      BuildContext context, String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Handle the option tap here
      },
    );
  }

  Widget _buildSwitchOption(String title, String subtitle) {
    bool switchValue = false;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return ListTile(
          title: Text(title),
          subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
          trailing: Switch(
            value: switchValue,
            onChanged: (bool value) {
              setState(() {
                switchValue = value;
              });
            },
          ),
        );
      },
    );
  }
}