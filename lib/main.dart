import 'package:flutter/material.dart';
import 'package:repeater/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your applicatioasdn.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
