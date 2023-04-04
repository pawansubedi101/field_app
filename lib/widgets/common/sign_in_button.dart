import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
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
          // height: 40,
          // width: double.minPositive,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
                colors: [Colors.green, Colors.greenAccent]),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sign In For Today ",
                  style: TextStyle(color: Colors.white),
                ),
                // ➜
                Icon(
                  Icons.login,
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
