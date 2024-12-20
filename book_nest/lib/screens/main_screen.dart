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

  static const List<Widget> _screenOptions = <Widget>[
    HomeScreen(),
    FavoriteScreen(),
    HistoryScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          //item pertama
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //item kedua
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          //item ketiga
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.greenAccent,
        unselectedItemColor: Colors.blueGrey,
      ),
    );
  }
}
