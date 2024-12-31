import 'package:flutter/material.dart';
import 'package:book_nest/screens/login_screen.dart';
import 'package:book_nest/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_nest/data/user_data.dart'; // Import user_data.dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Memeriksa apakah pengguna sudah login
  String? username = prefs.getString('username');
  bool isLoggedIn = username != null;

  // Set currentUser sesuai dengan username yang login
  if (isLoggedIn) {
    currentUser = userList.firstWhere((user) => user.username == username);
  }

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Nest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true, // Material Design 3
      ),
      home: isLoggedIn ? const MainScreen() : const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainScreen(),
         // Update rute ke MainScreen
      },
    );
  }
}
