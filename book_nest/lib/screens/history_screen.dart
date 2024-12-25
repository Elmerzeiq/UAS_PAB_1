import 'package:book_nest/data/home_data.dart';
import 'package:book_nest/models/home.dart';
import 'package:book_nest/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List<Home> _historyHomes = [];

  Future<void> _loadHistoryHomes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> historyHomesJuduls = prefs.getStringList('HistoryHomes') ?? [];
    setState(() {
      _historyHomes = homeList.where(
        (home) => historyHomesJuduls.contains(home.judul)
        
      ).toList();
    });
  }
  @override
  void initState() {
    super.initState();
    _loadHistoryHomes();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('History')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1280 / 1962,
                ),
                padding: const EdgeInsets.all(8),
                itemCount: _historyHomes.length,
                itemBuilder: (context, index) {
                  Home varHome = _historyHomes[index];
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
            ],
          ),
        ),
      ),
    );
  }
}