import 'package:flutter/material.dart';
import 'package:book_nest/data/user_data.dart'; // Import file user_data.dart
import 'package:book_nest/models/user.dart'; // Import file user.dart

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Jika tidak ada user yang login, tampilkan pesan
    if (currentUser == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Center(
          child: Text('No user is logged in'),
        ),
      );
    }

    // Ambil data user yang sedang login
    User user = currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Fungsi log out, bisa set currentUser ke null
              currentUser = null;
              Navigator.pop(context); // Keluar dari halaman profile
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(user.image),
            ),
            SizedBox(height: 20),
            Text('Username: ${user.username}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Email: ${user.email}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Phone: ${user.phone}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Address: ${user.address}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Fungsi untuk log out, bisa juga mempengaruhi currentUser
                currentUser = null;
                Navigator.pop(context); // Keluar ke halaman sebelumnya
              },
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
