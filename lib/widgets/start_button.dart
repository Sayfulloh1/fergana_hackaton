import 'package:flutter/material.dart';
class CircularStartButton extends StatelessWidget {
  const CircularStartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: ElevatedButton(
        onPressed: () {
          // Add your start button logic here
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.green,
        ),
        child: Center(
          child: const Text(
            'Start',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}