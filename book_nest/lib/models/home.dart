class Home {
  final String judul;
  final String penulis;
  final String isbn;
  final String description;
  final String tahunTerbit;
  final String genre;
  final String imageAsset;
  final List<String> imageUrls;

  Home({
    required this.judul,
    required this.penulis,
    required this.isbn,
    required this.description,
    required this.tahunTerbit,
    required this.genre,
    required this.imageAsset,
    required this.imageUrls,
  });
}