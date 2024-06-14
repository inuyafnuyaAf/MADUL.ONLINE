import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(CallCenterApp());
}

class CallCenterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CallCenterMenu(),
    );
  }
}

class CallCenterMenu extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {'name': 'Customer Service', 'phone': '123456789'},
    {'name': 'Technical Support', 'phone': '987654321'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call Center Menu'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(contacts[index]['name']!),
            subtitle: Text(contacts[index]['phone']!),
            trailing: IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                _makePhoneCall('tel:${contacts[index]['phone']}');
              },
            ),
          );
        },
      ),
    );
  }

  void _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}