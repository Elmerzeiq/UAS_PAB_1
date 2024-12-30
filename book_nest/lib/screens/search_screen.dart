import 'package:flutter/material.dart';
import 'package:book_nest/models/home.dart';
import 'package:book_nest/data/home_data.dart';
import 'package:book_nest/screens/detail_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Home> _filteredBooks = []; // Awalnya kosong
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Tambahkan listener untuk memperbarui hasil pencarian saat teks berubah
    _searchController.addListener(() {
      setState(() {
        if (_searchController.text.isEmpty) {
          // Jika teks pencarian kosong, jangan tampilkan buku
          _filteredBooks = [];
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
        title: Text('Search Books'),
      ),
      body: Column(
        children: [
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
          Expanded(
            child: _filteredBooks.isNotEmpty
                ? ListView.builder(
                    itemCount: _filteredBooks.length,
                    itemBuilder: (context, index) {
                      final book = _filteredBooks[index];
                      return ListTile(
                        leading: Image.asset(book.imageAsset,
                            width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(book.judul),
                        subtitle: Text('By: ${book.penulis}'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(varHome: book)),
                          );
                          // Aksi saat buku dipilih, misalnya navigasi ke detail buku
                        },
                      );
                    },
                  )
                : Center(
                    child: Text('No books found'),
                  ),
          ),
        ],
      ),
    );
  }
}
