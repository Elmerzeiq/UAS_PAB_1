import 'package:book_nest/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:book_nest/data/home_data.dart';
import 'package:book_nest/models/home.dart';
import 'package:book_nest/screens/add_book_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Home> _filteredBooks = homeList; // Awalnya semua buku ditampilkan
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Tambahkan listener untuk memperbarui hasil pencarian saat teks berubah
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          // Jika teks pencarian kosong, tampilkan semua buku
          _filteredBooks = homeList;
        } else {
          // Filter daftar buku berdasarkan judul atau penulis
          _filteredBooks = homeList.where((book) {
            return book.judul
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()) ||
                book.penulis
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase());
          }).toList();
        }
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: false,
        automaticallyImplyLeading: false, // Menonaktifkan logo panah
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search by title or author',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            // Judul Rekomendasi Buku Anda
            // Judul Rekomendasi Buku Anda + Ikon Tambah
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rekomendasi Buku Anda",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle_outline),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddBookScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),

            // GridView buku
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1280 / 1962,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: _filteredBooks.length,
                itemBuilder: (context, index) {
                  Home varHome = _filteredBooks[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(varHome: varHome)));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.all(6),
                      elevation: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Gambar Tempat
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.asset(
                                varHome.imageAsset,
                                fit: BoxFit.cover,
                                width: 1280,
                                height: 1962,
                              ),
                            ),
                          ),
                          // Nama Tempat
                          Padding(
                            padding: const EdgeInsets.only(left: 16, top: 8),
                            child: Text(
                              varHome.judul,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          // Lokasi Tempat
                          Padding(
                            padding: const EdgeInsets.only(left: 16, bottom: 8),
                            child: Text(
                              varHome.penulis,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
