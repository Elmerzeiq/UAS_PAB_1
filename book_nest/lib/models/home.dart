class Home {
  final String judul;
  final String penulis;
  final String isbn;
  final String description;
  final String tahunTerbit;
  final String genre;
  final String editor;
  final String korektor;
  final String setter;
  final String desainCover;
  final String imageAsset;
  final List<String> imageUrls;

  Home({
    required this.judul,
    required this.penulis,
    required this.isbn,
    required this.description,
    required this.tahunTerbit,
    required this.genre,
    required this.editor,
    required this.korektor,
    required this.setter,
    required this.desainCover,
    required this.imageAsset,
    required this.imageUrls,
  });
}