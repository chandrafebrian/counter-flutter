import 'package:counter/aplikasi.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chandra F',
      debugShowCheckedModeBanner: false,
      home: Aplikasi(),
    );
  }
}
