import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_app_challenge/ui/common_widgets/black_button.dart';

import '../cart/cart.dart';
import '../common_widgets/appBar.dart';
import 'widgets/items_slider.dart';
import 'widgets/my_bottom_sheet.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<bool> isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppAppBar(appBar: AppBar()),
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: ValueListenableBuilder(
                  valueListenable: isExpanded,
                  builder: (context, value, child) {
                    return ItemsSlider(isExpanded.value);
                  })),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {},
              onPanUpdate: (details) {
                if (details.delta.dy < 0) {
                  isExpanded.value = true;
                  showModalBottomSheet(
                      context: context,
                      barrierColor: Colors.black.withOpacity(0.05),
                      elevation: 10,
                      isScrollControlled: true,
                      constraints: BoxConstraints(minHeight: h * 0.7, maxHeight: h * 0.7),
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                      builder: (context) {
                        return const MyBottomSheet();
                      }).whenComplete(() => isExpanded.value = false);
                }
              },
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Cart(),
                        ));
                      },
                      child: const BlackButton(text: "Add to Cart")),
                  const Positioned(
                    bottom: 90,
                    child: Text(
                      "Swipe to see Recipe",
                      textScaleFactor: 1.1,
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    bottom: -120,
                    child: Transform(
                      transform: Matrix4.identity()
                        ..rotateY(pi)
                        ..rotateZ(0.1),
                      alignment: FractionalOffset.center,
                      child: Image.asset(
                        'assets/bottom_fruits2.png',
                        width: w,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
