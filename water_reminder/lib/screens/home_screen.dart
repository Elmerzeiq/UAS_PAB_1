import 'dart:async'; // Untuk Timer
import 'package:flutter/material.dart';
import '../widgets/water_progress.dart';
import '../widgets/water_input.dart';
import '../services/notification_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificationService notificationService = NotificationService();
  int target = 1630; // Target minuman harian dalam ml
  int currentIntake = 450; // Jumlah air yang diminum saat ini

  final List<Map<String, String>> drinkLogs = [
    // {"time": "10:28", "amount": "150 ml"},
    // {"time": "10:27", "amount": "150 ml"},
    // {"time": "10:26", "amount": "150 ml"},
    // {"time": "10:25", "amount": "150 ml"},
    // {"time": "10:24", "amount": "150 ml"},
    // {"time": "10:23", "amount": "150 ml"},
  ]; // Contoh data log air minum

  late String currentTime; // Untuk menyimpan waktu realtime
  late Timer timer; // Timer untuk memperbarui waktu

  @override
  void initState() {
    super.initState();

    // Inisialisasi waktu realtime
    currentTime = _formatTime(DateTime.now());
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        currentTime = _formatTime(DateTime.now());
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Pastikan timer dihentikan ketika widget dihapus
    super.dispose();
  }

  // Format waktu dalam jam:menit:detik
  String _formatTime(DateTime time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:${time.second.toString().padLeft(2, '0')}";
  }

  void addWater(int amount) async {
    setState(() {
      currentIntake += amount;
      drinkLogs.add({
        "time": currentTime, // Gunakan waktu realtime saat ini
        "amount": "$amount ml",
      });
    });

    // Cek jika target tercapai
    if (currentIntake >= target) {
      await notificationService.showNotification(
        "Selamat!",
        "Anda sudah cukup minum air hari ini.",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengingat Minum Air'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              "Jangan minum air dingin segera setelah hal-hal panas seperti teh atau kopi",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              "Waktu saat ini: $currentTime", // Tampilkan waktu realtime
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            WaterProgress(target: target, current: currentIntake),
            SizedBox(height: 20),
            WaterInput(onAddWater: addWater),
            SizedBox(height: 20),
            Text(
              "Catatan Minum Air Hari Ini",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              height: 300, // Tinggi tetap untuk daftar agar bisa scroll sendiri
              child: drinkLogs.isEmpty
                  ? Center(
                      child: Text(
                        "Belum ada catatan minum air",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: drinkLogs.length,
                      itemBuilder: (context, index) {
                        final log = drinkLogs[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                log['time']!,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 10),
                              Text(
                                log['amount']!,
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
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
