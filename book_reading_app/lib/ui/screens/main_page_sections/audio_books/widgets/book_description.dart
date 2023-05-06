import 'package:flutter/material.dart';

class OverViewWidget extends StatefulWidget {
  final String text;
  const OverViewWidget({super.key, required this.text});

  @override
  State<OverViewWidget> createState() => _OverViewWidgetState();
}

class _OverViewWidgetState extends State<OverViewWidget> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Overview",
          textScaleFactor: 1.5,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        InkWell(
          onTap: () {
            setState(() {
              showMore = !showMore;
            });
          },
          child: showMore
              ? Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                )
              : Text(
                  widget.text,
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
        )
      ],
    );
  }
}
