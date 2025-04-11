import 'package:flutter/material.dart';

class AddBookScreen extends StatefulWidget {
  const AddBookScreen({super.key});

  @override
  State<AddBookScreen> createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _penulisController = TextEditingController();
  final TextEditingController _tahunController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Buku"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(labelText: "Judul Buku"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Judul buku tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _penulisController,
                decoration: const InputDecoration(labelText: "Nama Penulis"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama penulis tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tahunController,
                decoration: const InputDecoration(labelText: "Tahun Terbit"),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tahun terbit tidak boleh kosong';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _isbnController,
                decoration: const InputDecoration(labelText: "ISBN"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ISBN tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Di sini kamu bisa menambahkan logika untuk menyimpan data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Buku berhasil ditambahkan")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("Simpan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
