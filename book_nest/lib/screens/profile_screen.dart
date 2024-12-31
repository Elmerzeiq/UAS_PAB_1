import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Fungsi logout yang akan memanggil Navigator untuk menuju halaman login
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // Menghapus data login
    await prefs.remove('email'); // Menghapus data email

    // Setelah logout, arahkan ke halaman login
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          // Tombol logout di AppBar
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Foto Profil dari folder images
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/sikancil.jpg'), // Gambar dari folder images
            ),
            SizedBox(height: 20),
            // Menampilkan teks statis untuk informasi pengguna
            Text(
              'Username: Admin_Booknest',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Email: adminbooknest@gmail.com',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Phone: 0822-8075-9989',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Address: Jl. Rajawali',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            // Tombol Logout di bawah
            ElevatedButton(
              onPressed: () => _logout(context),
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
