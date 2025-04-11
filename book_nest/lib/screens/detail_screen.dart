import 'package:book_nest/models/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

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

  Future<void> _addToHistory(String judul) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyHomes = prefs.getStringList('HistoryHomes') ?? [];

    if (!historyHomes.contains(judul)) {
      historyHomes.add(judul);
      await prefs.setStringList('HistoryHomes', historyHomes);
    }
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
          SnackBar(
              content: Text('${widget.varHome.judul} removed from favorites')),
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

  // Fungsi untuk membuka URL
  Future<void> _launchURL(String url) async {
    if (url.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('URL tidak tersedia')),
      );
      return;
    }

    final Uri uri = Uri.parse(url);
    if (!await launch(uri.toString())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal membuka URL: $url')),
      );
    }
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                          color: _isFavorite ? Colors.red : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Informasi lainnya
                    Row(
                      children: [
                        const Icon(Icons.person, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Penulis',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.penulis}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.calendar_month, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Tahun Terbit',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.tahunTerbit}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.book, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('ISBN',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.isbn}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.edit, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Editor',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.editor}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.format_align_left,
                            color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Setter',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.setter}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Korektor',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.korektor}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.image, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Desain Cover',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.desainCover}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.library_books, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Genre',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.genre}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.label, color: Colors.green),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 100,
                          child: Text('Edisi',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${widget.varHome.edisi}'),
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
                    const SizedBox(height: 16),

                    // Tombol Baca Buku
                    if (widget.varHome.linkJurnal.isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () async {
                          await _addToHistory(widget.varHome.judul);
                          _launchURL(widget.varHome.linkJurnal);
                        },
                        icon: const Icon(Icons.book, color: Colors.white),
                        label: const Text(
                          'Baca Buku',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),
                    if (widget.varHome.linkJurnal.isNotEmpty)
                      ElevatedButton.icon(
                        onPressed: () async {
                          await _addToHistory(widget.varHome.judul);
                          _launchURL(widget.varHome.linkJurnal);
                        },
                        icon: const Icon(Icons.book, color: Colors.white),
                        label: const Text(
                          'Download Buku',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
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
