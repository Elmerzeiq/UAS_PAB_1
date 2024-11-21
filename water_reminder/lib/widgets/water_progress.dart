import 'package:flutter/material.dart';

class WaterProgress extends StatelessWidget {
  final int target;
  final int current;

  WaterProgress({required this.target, required this.current});

  @override
  Widget build(BuildContext context) {
    double progress = current / target;

    return Column(
      children: [
        Text(
          "$current / $target ml",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 10,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Text("${(progress * 100).toStringAsFixed(1)}%"),
          ],
        ),
      ],
    );
  }
}
