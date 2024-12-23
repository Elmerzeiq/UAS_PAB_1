import 'package:flutter/material.dart';
import 'package:book_nest/screens/home_screen.dart'; // Halaman Home
import 'package:book_nest/screens/search_screen.dart'; // Halaman Search
import 'package:book_nest/screens/favorite_screen.dart'; // Halaman Favorite
// import 'package:book_nest/screens/history_screen.dart'; // Halaman History
// import 'package:book_nest/screens/profile_screen.dart'; // Halaman Profile

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Indeks halaman aktif

  // Fungsi untuk mengatur perpindahan halaman berdasarkan indeks
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Daftar halaman yang akan ditampilkan sesuai tab
  final List<Widget> _pages = [
    const HomeScreen(), // Halaman Home
    const SearchScreen(), // Halaman Search
    const FavoriteScreen(), // Halaman Favorite
    // const HistoryScreen(), // Halaman History
    // const ProfileScreen(), // Halaman Profile
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Menampilkan halaman sesuai indeks aktif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Indeks aktif
        onTap: _onTabTapped, // Callback saat item ditekan
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.history),
          //   label: 'History',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   label: 'Profile',
          // ),
        ],
      ),
    );
  }
}
