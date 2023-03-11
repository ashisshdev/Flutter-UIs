import 'dart:math';

import 'package:flutter/material.dart';

class ImageSizeWidget extends StatefulWidget {
  final String image;
  final Color color;
  final String message;

  const ImageSizeWidget({
    Key? key,
    required this.image,
    required this.color,
    required this.message,
  }) : super(key: key);

  @override
  State<ImageSizeWidget> createState() =>
      _ImageSizeWidgetState();
}

class _ImageSizeWidgetState extends State<ImageSizeWidget> {
  int size = 250;

  _updateSize(int newSize) {
    if (newSize != size) {
      setState(() {
        size = newSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.70,
          child: Hero(
            tag: widget.image,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: size.toDouble(),
              curve: Curves.fastOutSlowIn,
              child: Transform(
                  transform: Matrix4.rotationY(pi),
                  alignment: Alignment.center,
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.contain,
                  )),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectSizeButton(
                  onStarbucksSizeChanged: () {
                    _updateSize(200);
                  },
                  backgroundColor: widget.color.withOpacity(0.2),
                  text: "S"),
              SelectSizeButton(
                  onStarbucksSizeChanged: () {
                    _updateSize(250);
                  },
                  backgroundColor: widget.color.withOpacity(0.2),
                  text: "M"),
              SelectSizeButton(
                  onStarbucksSizeChanged: () {
                    _updateSize(300);
                  },
                  backgroundColor: widget.color.withOpacity(0.2),
                  text: "L")
            ],
          ),
        )
      ],
    );
  }
}

class SelectSizeButton extends StatelessWidget {
  const SelectSizeButton({
    required this.onStarbucksSizeChanged,
    required this.backgroundColor,
    required this.text,
    super.key,
  });

  final VoidCallback onStarbucksSizeChanged;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onStarbucksSizeChanged(),
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(24),
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
      ),
    );
  }
}
