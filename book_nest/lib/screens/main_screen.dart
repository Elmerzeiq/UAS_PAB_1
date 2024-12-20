import 'package:flutter/material.dart';
import 'package:book_nest/screens/favorite_screen.dart';
import 'package:book_nest/screens/home_screen.dart';
import 'package:book_nest/screens/history_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Daftar screen yang akan ditampilkan
  static final List<Widget> _screenOptions = <Widget>[
    const HomeScreen(), // Home screen
    const FavoriteScreen(), // Favorite screen
    const HistoryScreen(), // History screen
  ];

  // Fungsi untuk mengubah indeks berdasarkan item yang di-tap
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions[_selectedIndex], // Tampilkan screen sesuai indeks
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // Item pertama
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          // Item kedua
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          // Item ketiga
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
        currentIndex: _selectedIndex, // Indeks yang sedang dipilih
        onTap: _onItemTapped, // Callback saat item dipilih
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.greenAccent, // Warna item yang dipilih
        unselectedItemColor: Colors.blueGrey, // Warna item yang tidak dipilih
      ),
    );
  }
}
