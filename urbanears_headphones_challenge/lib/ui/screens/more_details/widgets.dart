import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 750),
      tween: Tween<double>(begin: 1, end: 0),
      builder: (context, value, child) {
        return ClipPath(
          clipper: CardClipper(value),
          child: Image.asset(
            'assets/building.jpg',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        );
      },
    );
  }
}

class AdvertisingVideoCard extends StatelessWidget {
  const AdvertisingVideoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 550),
      tween: Tween<double>(begin: 1, end: 0),
      builder: (context, value, child) {
        return Container(
          color: Colors.white,
          child: ClipPath(
            clipper: CardClipper(value),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'ADVERTISING\nVIDEO',
                    textScaleFactor: 0.9,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text(
                        'PLAY',
                        textScaleFactor: 0.9,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      Icon(Icons.play_arrow)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardClipper extends CustomClipper<Path> {
  final double animationValue;

  CardClipper(this.animationValue);
  @override
  getClip(Size size) {
    Path path = Path()..addRect(Rect.fromLTRB(size.width * animationValue, 0, size.width, size.height));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
