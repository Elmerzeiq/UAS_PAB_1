import 'package:flutter/material.dart';

class WaterInput extends StatelessWidget {
  final Function(int) onAddWater;

  WaterInput({required this.onAddWater});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onAddWater(150),
          child: Text("+150 ml"),
        ),
      ],
    );
  }
}
