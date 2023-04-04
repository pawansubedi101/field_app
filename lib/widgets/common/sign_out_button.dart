import 'package:flutter/material.dart';

class SignOutButton extends StatelessWidget {
  const SignOutButton({
    Key? key,
    required this.onpress,
  }) : super(key: key);

  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Material(
        elevation: 5,
        shadowColor: Colors.black26,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                colors: [Colors.red.shade800, Colors.red.shade200]),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sign Out For Today ",
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.logout,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
