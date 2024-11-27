import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Simulasi operasi asinkron
    _performAsyncOperation();
  }

  Future<void> _performAsyncOperation() async {
    // Contoh operasi asinkron
    await Future.delayed(const Duration(seconds: 2));

    // Cek apakah widget masih terpasang sebelum menggunakan BuildContext
    if (mounted) {
      // Pastikan hanya melakukan perubahan UI jika widget masih ada
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AnotherScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Menavigasi ke halaman lain
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AnotherScreen()),
            );
          },
          child: const Text('Go to Another Screen'),
        ),
      ),
    );
  }
}

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Screen'),
      ),
      body: const Center(
        child: Text('This is another screen'),
      ),
    );
  }
}
