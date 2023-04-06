import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:food_app_challenge/data/data.dart';
import 'package:food_app_challenge/ui/cart/cart.dart';

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      decoration: const BoxDecoration(),
      child: PageView(
        controller: pageController,
        children: [
          IngredientsSection(
            ontap: () {
              pageController.animateToPage(1,
                  duration: const Duration(milliseconds: 100), curve: Curves.ease);
            },
          ),
          MoreIngredientsSection(
            ontap: () {
              pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 100), curve: Curves.ease);
            },
          )
        ],
      ),
    );
  }
}

class IngredientsSection extends StatelessWidget {
  final Function ontap;

  const IngredientsSection({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            child: AnimationLimiter(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: allIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient = allIngredients[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 275),
                    child: FadeInAnimation(
                      delay: const Duration(milliseconds: 150),
                      child: SlideAnimation(
                        horizontalOffset: (index + 1) * -200,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 15),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Container(
                              padding: const EdgeInsets.only(left: 50),
                              margin: EdgeInsets.only(bottom: value),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ingredient.image,
                                    height: 75,
                                    width: 75,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ingredient.name,
                                        textScaleFactor: 1.4,
                                        style:
                                            const TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        ingredient.quantity,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              width: w * 0.85,
              height: 55,
              child: InkWell(
                onTap: () {
                  ontap();
                },
                child: DottedBorder(
                    color: Colors.pink.shade200,
                    strokeWidth: 2,
                    dashPattern: const [5, 4],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(15),
                    child: const Center(
                      child: Text(
                        "Add Ingredient",
                        textScaleFactor: 1.2,
                        style: TextStyle(color: Colors.pink, fontWeight: FontWeight.w600),
                      ),
                    )),
              )),
          InkWell(
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const Cart(),
              ));
            },
            child: Container(
                margin: const EdgeInsets.only(top: 15),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: w * 0.87,
                height: 65,
                child: const Center(
                  child: Text(
                    "Add to Cart",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                )),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class MoreIngredientsSection extends StatelessWidget {
  final Function ontap;

  const MoreIngredientsSection({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(
            child: AnimationLimiter(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: moreIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient = moreIngredients[index];

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: FadeInAnimation(
                      delay: const Duration(milliseconds: 150),
                      child: SlideAnimation(
                        horizontalOffset: (index + 1) * 200,
                        child: TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 600),
                          tween: Tween<double>(begin: 0, end: 15),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Container(
                              width: w * 0.85,
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              margin: EdgeInsets.only(bottom: value),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ingredient.image,
                                    height: 80,
                                    width: 80,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(width: 30),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ingredient.name,
                                        textScaleFactor: 1.4,
                                        style:
                                            const TextStyle(fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        ingredient.quantity,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          InkWell(
            onTap: () {
              ontap();
            },
            child: Container(
                margin: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                width: w * 0.87,
                height: 64,
                child: const Center(
                  child: Text(
                    "Confirm",
                    textScaleFactor: 1.2,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                )),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
