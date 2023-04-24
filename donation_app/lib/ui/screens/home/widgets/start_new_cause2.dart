import 'package:flutter/material.dart';

class StartNewCause2 extends StatelessWidget {
  const StartNewCause2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: const BoxDecoration(
        // color: Colors.grey.withOpacity(.2),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Start New Cause",
                textScaleFactor: 1.4,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 6),
              Text(
                "and invite Friends who also donate.",
                textScaleFactor: 1.1,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2F44CC), width: 2)),
              child: const Icon(Icons.arrow_forward, size: 30, color: Color(0xFF2F44CC)))
        ],
      ),
    );
  }
}
