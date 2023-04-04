import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines,
      required this.keyboardType,
      required this.prefixIcon,
      this.isPasswordField = false});
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType keyboardType;
  final IconData prefixIcon;
  final bool isPasswordField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return widget.isPasswordField
        ? BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.9),
                  border: Border.all(color: Colors.white, width: 1.5),
                  borderRadius: BorderRadius.circular(50)),
              alignment: Alignment.center,
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  obscureText: _obscureText,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(height: 0, fontSize: 0.5),
                      contentPadding: const EdgeInsets.all(16),
                      prefixIcon: Icon(
                        widget.prefixIcon,
                        size: 20,
                        color: Colors.white,
                      ),
                      hintText: widget.hintText,
                      hintStyle: GoogleFonts.poppins(color: Colors.white),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      border: InputBorder.none),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("${widget.hintText} is required."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return '';
                    } else if (value.length < 8) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text(
                              "${widget.hintText} length should be greater than 8 characters"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return '';
                    }
                  },
                  maxLines: widget.maxLines,
                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          )
        : SizedBox(
            height: 52,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    border: Border.all(color: Colors.white, width: 1.5),
                    borderRadius: BorderRadius.circular(50)),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: widget.controller,
                  keyboardType: widget.keyboardType,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10)
                  ],
                  // style: GoogleFonts.poppins(height: 0),
                  decoration: InputDecoration(
                      errorStyle: const TextStyle(height: 0, fontSize: 0.5),
                      prefixIcon: const Icon(
                        Icons.phone,
                        size: 20,
                        color: Colors.white,
                      ),
                      contentPadding: const EdgeInsets.all(16),
                      hintText: widget.hintText,
                      hintStyle: GoogleFonts.poppins(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(50)),
                      border: InputBorder.none),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("${widget.hintText} is required."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return '';
                    } else if (value.length < 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: Text("${widget.hintText} is incorrect."),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return '';
                    }
                  },

                  maxLines: 1,

                  style: GoogleFonts.poppins(color: Colors.white),
                ),
              ),
            ),
          );
  }
}
