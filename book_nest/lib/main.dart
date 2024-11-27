import 'package:book_nest/screens/login_screen.dart'; // Import halaman Login
import 'package:flutter/material.dart';

void main() {
  runApp(const BookNestApp());
}

class BookNestApp extends StatelessWidget {
  const BookNestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Book Nest',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(), // Halaman awal adalah LoginScreen
    );
  }
}
