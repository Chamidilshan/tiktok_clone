import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscured;
  final IconData icon;
  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
   this.isObscured = false,
    required this.icon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        labelStyle: TextStyle(
          fontSize: 20.0
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: borderColor
          )
        ),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: borderColor
          )
        )
      ),
      obscureText: isObscured,
    );
  }
}
