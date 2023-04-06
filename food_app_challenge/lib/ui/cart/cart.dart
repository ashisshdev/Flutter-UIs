// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_app_challenge/data/data.dart';

import '../common_widgets/appBar.dart';
import 'widgets/bounce.dart';
import 'widgets/items_list.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppAppBar(appBar: AppBar()),
      body: SafeArea(
          child: SizedBox(
        height: h,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 22, top: 18, bottom: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "My Order",
                    textScaleFactor: 2.2,
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: (animationController.value * 30) + 30),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: 1 - animationController.value,
                          duration: const Duration(milliseconds: 100),
                          child: SizedBox(
                            height: 380 - (380 * animationController.value),
                            child: child!,
                          ),
                        );
                      },
                      child: const CartItemsList()),
                  AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return AnimatedOpacity(
                          opacity: 1 - animationController.value,
                          duration: const Duration(milliseconds: 100),
                          child: SizedBox(
                              height: 80 - (80 * animationController.value),
                              child: child!),
                        );
                      },
                      child: const TotalAmount()),
                  BounceWidget(
                    begin: 1.2,
                    delay: const Duration(milliseconds: 50),
                    duration: const Duration(milliseconds: 500),
                    child: AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return InkWell(
                          onTap: () => animationController.forward(),
                          child: Container(
                            width: w,
                            height: (animationController.value * 400) + h * 0.08,
                            // margin: EdgeInsets.symmetric(horizontal: w * 0.1),
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.all(Radius.circular(15))),
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: animationController.value < .20
                                  ? Opacity(
                                      opacity: 1 - (animationController.value * 2),
                                      child: const Center(
                                          child: Text(
                                        "Checkout",
                                        textScaleFactor: 1.1,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      )),
                                    )
                                  : SuccessOrderCard(
                                      animationValue: animationController.value),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Image.asset(
              'assets/bottom_fruits.png',
              width: w,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            )
          ],
        ),
      )),
    );
  }
}

class SuccessOrderCard extends StatelessWidget {
  final double animationValue;

  const SuccessOrderCard({super.key, required this.animationValue});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: animationValue * constraints.maxHeight * .10,
            ),
            const Text(
              'Amount',
              textScaleFactor: 2.2,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            SizedBox(
              height: animationValue * constraints.maxHeight * .03,
            ),
            const Text(
              '\$90',
              textScaleFactor: 2.2,
              style: TextStyle(fontWeight: FontWeight.w400, color: Colors.pink),
            ),
            SizedBox(
              height: constraints.maxHeight * .035,
            ),
            const Flexible(
              child: AnimatingTick(),
            ),
            const Spacer(),
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              clipBehavior: Clip.hardEdge,
              height: animationValue * constraints.maxHeight * .4,
              child: SuccessOrderCardBottomImages(constraints: constraints),
            )
          ],
        );
      },
    );
  }
}

class SuccessOrderCardBottomImages extends StatelessWidget {
  final BoxConstraints constraints;

  const SuccessOrderCardBottomImages({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 200),
      tween: Tween<Offset>(begin: const Offset(0, 100), end: const Offset(0, 0)),
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                  height: constraints.maxHeight * .3,
                  left: -50,
                  bottom: -40,
                  child: Image.asset(
                    cartItems[0].image,
                    scale: 1.5,
                  )),
              Positioned(
                  height: constraints.maxHeight * .3,
                  right: -50,
                  bottom: -40,
                  child: Image.asset(cartItems[2].image)),
              Positioned(
                  height: constraints.maxHeight * .4,
                  left: 0,
                  right: 0,
                  bottom: -40,
                  child: Image.asset(cartItems[1].image))
            ],
          ),
        );
      },
    );
  }
}

class AnimatingTick extends StatelessWidget {
  const AnimatingTick({super.key});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      builder: (context, value, child) {
        return Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1.2),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.done,
              size: 44,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}

class TotalAmount extends StatelessWidget {
  const TotalAmount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
      // padding: EdgeInsets.zero,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            "Total Amount :",
            textScaleFactor: 1.6,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          Text(
            '\$90',
            textScaleFactor: 1.7,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.pink),
          )
        ],
      ),
    );
  }
}
