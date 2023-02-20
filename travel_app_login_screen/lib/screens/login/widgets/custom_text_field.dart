import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIconData;
  final String hint;

  const CustomTextField(
      {super.key, required this.prefixIconData, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.white,
            )),
      ),
    );
  }
}
