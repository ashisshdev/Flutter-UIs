import 'package:coffee_shop/data/data.dart';
import 'package:coffee_shop/screens/product_details/widgets/product_details_page_widgets.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

import 'widgets/modal_bottom_sheet/modal_bottom_sheet.dart';

class Details extends StatefulWidget {
  final Coffee coffee;
  const Details({super.key, required this.coffee});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFDAB68C),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: h * 0.59,
                child: Stack(
                  children: [
                    /// Name, Detail, Rating
                    Positioned(
                      top: 0,
                      child: SizedBox(
                        height: h * 0.51,
                        width: w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60, left: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: w * 0.45,
                                    child: Text(widget.coffee.name,
                                        maxLines: 2,
                                        style: varelaWhite.copyWith(
                                            fontSize: 35, fontWeight: FontWeight.bold)),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                      height: 40.0,
                                      width: 40.0,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20.0),
                                          color: Colors.white),
                                      child: const Center(
                                          child:
                                              Icon(Icons.favorite, size: 18.0, color: Colors.red)))
                                ],
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.5, left: 10),
                              child: SizedBox(
                                child: Text(
                                    'Freshly steamed milk with vanilla-flavored syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
                                    style: varelaWhite.copyWith(fontSize: 16, height: 1.3)),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.5, left: 10),
                              child: const RatingWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// Preparation Time
                    Positioned(
                      bottom: 0,
                      height: h * 0.11,
                      width: w,
                      child: const PreparationTime(),
                    ),

                    /// Image
                    Positioned(
                      bottom: h * 0.04,
                      right: -5,
                      height: h * 0.4,
                      width: w * 0.65,
                      child: Hero(
                        tag: widget.coffee.image,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                                image: AssetImage(widget.coffee.image),
                                alignment: Alignment.bottomRight,
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.only(left: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Divider(height: 1, thickness: 0.15, color: Colors.black38),
                  const SizedBox(height: 15.0),
                  const DetailsCategoryTitle(title: "Ingredients"),
                  const SizedBox(height: 15.0),
                  SizedBox(
                    height: 90.0,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children:
                            coffeeIngredients.map((e) => IngredientIcon(ingredient: e)).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Divider(height: 1, thickness: 0.15, color: Colors.black38),
                  const SizedBox(height: 15.0),
                  const DetailsCategoryTitle(title: "Nutritional Information"),
                  const SizedBox(height: 15.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: SizedBox(
                      width: w * 0.35,
                      child: const NutrientsList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                      height: h * 0.1,
                      width: w,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.white,
                            isDismissible: true,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return const ModelSheet();
                            },
                          );
                        },
                        child: const CustomizeNowButton(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
