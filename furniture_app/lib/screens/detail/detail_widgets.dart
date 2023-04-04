import 'package:flutter/material.dart';
import 'package:furniture_app/data/data.dart';
import 'package:simple_shadow/simple_shadow.dart';

class MyCustomClipper extends CustomClipper<Path> {
  final double animationValue;

  MyCustomClipper({required this.animationValue});

  @override
  getClip(Size size) {
    Path path = Path();
    path.addOval(Rect.fromCenter(
        center: Offset(0, size.height / 2),
        width: size.width * animationValue,
        height: size.height * animationValue));
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class ImageSection extends StatefulWidget {
  final Product product;
  const ImageSection({super.key, required this.product});

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection> with SingleTickerProviderStateMixin {
  late AnimationController clipperAnimation;
  late Product product;

  int currentImageIndex = 0;
  int previousImageIndex = 0;

  @override
  void initState() {
    product = widget.product;
    clipperAnimation = AnimationController(
        vsync: this, duration: const Duration(seconds: 2), upperBound: 5);
    super.initState();
  }

  changeImage(int newImageIndex) {
    if (newImageIndex != currentImageIndex) {
      setState(() {
        currentImageIndex = newImageIndex;
      });
      clipperAnimation.forward(from: 0).whenComplete(() {
        setState(() {
          previousImageIndex = currentImageIndex;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    clipperAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned.fill(
          child: SimpleShadow(
            offset: const Offset(2, 5),
            child: Container(
              width: w,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(35))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Flexible(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (final color in product.colors) ...[
                            InkWell(
                              onTap: () {
                                final index = product.colors.indexOf(color);
                                changeImage(index);
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: color,
                                ),
                              ),
                            )
                          ],
                        ],
                      )),
                  // const Spacer(),
                  Flexible(
                    flex: 4,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Image.asset(
                                  product.images[previousImageIndex],
                                  key: Key(previousImageIndex.toString()),
                                  height: h * .4,
                                  fit: BoxFit.cover,
                                )),
                              ),
                            ],
                          ),
                        ),
                        Positioned.fill(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AnimatedBuilder(
                                  animation: clipperAnimation,
                                  builder: (context, child) {
                                    return ClipPath(
                                      clipper: MyCustomClipper(
                                          animationValue: clipperAnimation.value),
                                      child: Center(
                                          child: Image.asset(
                                        product.images[currentImageIndex],
                                        key: Key(currentImageIndex.toString()),
                                        height: h * .4,
                                        fit: BoxFit.cover,
                                      )),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
