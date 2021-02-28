import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final Widget icon;
  final bool obscureText;
  final TextEditingController controller;

  const AppTextField(
      {Key key,
      this.hintText,
      this.icon,
      this.obscureText = false,
      this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        prefixIcon: icon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusColor: Colors.white54,
        fillColor: Colors.white54,
        hoverColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
      ),
    );
  }
}
