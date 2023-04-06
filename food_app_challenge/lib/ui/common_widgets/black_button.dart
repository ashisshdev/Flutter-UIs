import 'package:flutter/material.dart';

class BlackButton extends StatelessWidget {
  final String text;
  const BlackButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
      decoration: const BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Center(
          child: Text(
        text,
        textScaleFactor: 1.3,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      )),
    );
  }
}
