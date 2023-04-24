import 'package:donation_app/models/item.dart';
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final Item item;
  const ImageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      clipBehavior: Clip.hardEdge,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final h = constraints.maxHeight;
          final w = constraints.maxWidth;
          return Stack(
            children: [
              /// LOGIC for showing progress
              // Positioned.fill(
              //   top: 0,
              //   child: Image.asset(
              //     item.image,
              //     width: w,
              //     fit: BoxFit.fitWidth,
              //     alignment: Alignment.topCenter,
              //   ),
              // ),
              // Positioned(
              //   top: 0,
              //   child: ColorFiltered(
              //     colorFilter: ColorFilter.mode(Colors.grey, BlendMode.saturation),
              //     child: Image.asset(
              //       item.image,
              //       width: w,
              //       height: h - ((item.porgress / 100) * h),

              //       fit: BoxFit.fitWidth,
              //       // color: Colors.red,
              //       alignment: Alignment.topCenter,
              //     ),
              //   ),
              // ),
              /// LOGIC Ends here
              Positioned(
                top: 0,
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(Colors.white, BlendMode.saturation),
                  child: Image.asset(
                    item.image,
                    width: w,
                    fit: BoxFit.fitWidth,
                    // color: Colors.red,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                top: h * 0.71,
                left: 0,
                right: 0,
                child: Text(
                  item.name,
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontWeight: FontWeight.w700, color: Colors.black),
                ),
              ),
              Positioned(
                top: h * 0.7,
                left: 0,
                right: 0,
                child: Text(
                  item.name,
                  textScaleFactor: 1.2,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
              Positioned(
                top: h * 0.83,
                left: 0,
                right: 0,
                child: Text(
                  item.country,
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style:
                      const TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
