import 'package:flutter/material.dart';
// import 'package:pengaduan/splash_screen.dart';
import 'package:pengaduan/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi Role App",
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}
