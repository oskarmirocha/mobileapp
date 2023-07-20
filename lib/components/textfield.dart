import "package:flutter/material.dart";

class MyTextfield extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const MyTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(213, 116, 144, 185)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(179, 8, 99, 236)),
          ),
          fillColor: const Color.fromARGB(214, 161, 194, 243),
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(213, 116, 144, 185))
        ),
      ),
    );
  }
}
