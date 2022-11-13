import 'package:flutter/material.dart';
import 'package:todoapp/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To do list',
      theme: ThemeData(
          fontFamily: 'iranYekan', scaffoldBackgroundColor: Colors.grey[200]),
      home: const HomeScreen(),
    );
  }
}
