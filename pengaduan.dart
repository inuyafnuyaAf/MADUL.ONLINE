import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pengaduan/home_page.dart';
import 'package:pengaduan/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pengaduan extends StatelessWidget {
  const Pengaduan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/spalsh.png'),
        ],
      ),
    );
  }
}
