import 'package:book_nest/models/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailScreen extends StatefulWidget {
  final Home varHome;
  const DetailScreen({super.key, required this.varHome});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isFavorite = false;

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('FavoriteHomes') ?? [];
    setState(() {
      _isFavorite = favoriteHomes.contains(widget.varHome.judul);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteHomes = prefs.getStringList('FavoriteHomes') ?? [];

    setState(() {
      if (_isFavorite) {
        // Proses unfavorite
        favoriteHomes.remove(widget.varHome.judul);
        _isFavorite = false;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.varHome.judul} removed from favorites')),
        );
      } else {
        // Proses favorite
        favoriteHomes.add(widget.varHome.judul);
        _isFavorite = true;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.varHome.judul} added to favorites')),
        );
      }
    });

    await prefs.setStringList('FavoriteHomes', favoriteHomes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Bagian atas
              Stack(
                children: [
                  // Gambar utama
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        widget.varHome.imageAsset,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                  ),
                  // Tombol kembali
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Judul dan tombol favorit
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.varHome.judul,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: _toggleFavorite,
                          icon: Icon(
                            _isFavorite ? Icons.favorite : Icons.favorite_border,
                          ),
                          color: _isFavorite ? Colors.red : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Informasi lainnya
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.blue),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Penulis', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.penulis}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.orange),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Tahun Terbit', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.tahunTerbit}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.book, color: Colors.orange),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('ISBN', style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.isbn}'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.deepPurple.shade100, thickness: 1),
                    const SizedBox(height: 16),
                    // Deskripsi
                    Text(
                      widget.varHome.description,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.deepPurple.shade100, thickness: 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
