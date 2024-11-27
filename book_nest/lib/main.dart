import 'package:book_nest/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import halaman Login

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
      home: const RegisterScreen(), // Halaman awal adalah LoginScreen
    );
  }
}
