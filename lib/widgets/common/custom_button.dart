import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onpress, required this.child});

  final VoidCallback onpress;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            // backgroundColor: Colors.indigo,
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minimumSize: const Size(double.minPositive, 50)),
        onPressed: onpress,
        child: child);
  }
}
