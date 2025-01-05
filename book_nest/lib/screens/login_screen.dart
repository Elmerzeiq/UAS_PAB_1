import 'package:flutter/material.dart';
import 'package:book_nest/data/user_data.dart';
import 'package:book_nest/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_nest/screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 300),
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              SizedBox(
                width: 150,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                      'images/booknest.jpg'), // Ensure this file exists
                ),
              ),
              const SizedBox(height: 16),
              // Input Email
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              // Input Password
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              // Tombol Login
              ElevatedButton(
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  if (validateLogin(email, password)) {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIn', true);
                    await prefs.setString('email', email);
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Invalid Email or Password')),
                    );
                  }
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              // Link Register

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Hilangkan padding bawaan
                  minimumSize: Size.zero,
                  tapTargetSize:
                      MaterialTapTargetSize.shrinkWrap, // Kecilkan area klik
                  alignment: Alignment.centerLeft, // Posisi teks kiri
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'Belum punya akun? ', // Teks pertama (warna hitam)
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black, // Warna hitam
                    ),
                    children: [
                      TextSpan(
                        text: 'Register', // Teks kedua (warna biru)
                        style: TextStyle(
                          color: Colors.blue, // Warna biru seperti link
                          decoration: TextDecoration.underline, // Garis bawah
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  // Aksi untuk forgot password (misalnya hanya placeholder)
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft,
                ),
                child: RichText(
                  text: const TextSpan(
                    text: 'Forgot Password',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.red, // Warna merah untuk menarik perhatian
                      decoration: TextDecoration.underline, // Garis bawah
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateLogin(String email, String password) {
    for (User user in userList) {
      if (user.email == email && user.password == password) {
        return true;
      }
    }
    return false;
  }
}
