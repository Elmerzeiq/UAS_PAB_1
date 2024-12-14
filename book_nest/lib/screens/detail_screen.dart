import 'package:book_nest/models/home.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Home varHome;
  const DetailScreen({super.key, required this.varHome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //--------------atas-------------
              Stack(
                children: [
                  //image uatama
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        varHome.imageAsset,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 250,
                      ),
                    ),
                  ),
                  // tombol back
                  Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back)),
                  )
                ],
              ),
              const SizedBox(height: 16),
              //judul dibawahnya image utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // judul
                    Text(
                      varHome.judul,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    // info lainnya
                    Row(
                      children: [
                        const Icon(
                          Icons.person,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Penulis',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${varHome.penulis}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('Tahun Terbit',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${varHome.tahunTerbit}'),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.calendar_month,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 8),
                        const SizedBox(
                          width: 70,
                          child: Text('ISBN',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        Text(': ${varHome.isbn}'),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                    //Deskripsi
                    Text(
                      varHome.description,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 16),
                    Divider(
                      color: Colors.deepPurple.shade100,
                      thickness: 1,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),

              //--------------tengah-----------
              //--------------bawah------------
            ],
          ),
        ),
      ),
    );
  }
}
