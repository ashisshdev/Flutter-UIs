import 'package:fast_food_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class DonutPage extends StatelessWidget {
  final Donut donut;

  const DonutPage({
    Key? key,
    required this.donut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
        ),
        title: Text(
          donut.name,
          textScaleFactor: 1.2,
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        color: donut.color.withOpacity(0.2),
        child: Stack(
          children: [
            Positioned.fill(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.width * 0.8,
                    child: Hero(
                      tag: donut.image,
                      child: Container(
                        margin: const EdgeInsets.all(30),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(donut.image),
                                fit: BoxFit.contain)),
                      ),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 20),
                            child: Text(
                              donutDetail,
                              textScaleFactor: 1.4,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                                      .withOpacity(0.7)),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20, bottom: 15),
                          child: Text(
                            "Nutritional Facts",
                            textScaleFactor: 1.6,
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 140,
                            width: MediaQuery.of(context)
                                    .size
                                    .width *
                                0.99,
                            child: ListView.builder(
                              itemCount: nutrients.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return NutrientTile(
                                    color: donut.color,
                                    nutrient: nutrients[index]);
                              },
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 20, bottom: 15),
                          child: Text(
                            "Ingredients",
                            textScaleFactor: 1.6,
                            style: TextStyle(
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context)
                                    .size
                                    .width *
                                0.99,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20),
                              child: Wrap(
                                spacing: 10,
                                runSpacing: -5,
                                children: ingredients
                                    .map((e) => Chip(
                                          label: Text(e),
                                          backgroundColor: donut
                                              .color
                                              .withOpacity(0.1),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: 120,
                  ),
                ],
              ),
            ),
            Positioned.fill(
                bottom: 5,
                top: MediaQuery.of(context).size.height * 0.89,
                child: AddToCart(donut: donut)),
          ],
        ),
      ),
    );
  }
}

class NutrientTile extends StatelessWidget {
  final Color color;
  final Nutrient nutrient;

  const NutrientTile({
    Key? key,
    required this.color,
    required this.nutrient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(vertical: 12),
      height: 140,
      width: 75,
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(40)),
          border: Border.all(color: Colors.black, width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            nutrient.name,
            textScaleFactor: 1.3,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            nutrient.value,
            textScaleFactor: 0.8,
            style: const TextStyle(color: Colors.black54),
          ),
          CircleAvatar(
            radius: 26,
            backgroundColor: color.withOpacity(0.2),
            child: Text(
              "${nutrient.percentage.toStringAsFixed(0)}%",
              textScaleFactor: 1.1,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

String donutDetail =
    "The Sweet And Subtle Salty Combo of Chocolate Meets Caramel. Introduce the Caramel Duo To Your Mouth!";

class Nutrient {
  final String value;
  final double percentage;
  final String name;

  Nutrient(
      {required this.value,
      required this.percentage,
      required this.name});
}

class AddToCart extends StatelessWidget {
  final Donut donut;

  const AddToCart({
    Key? key,
    required this.donut,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.black54, width: 3)),
      padding: const EdgeInsets.symmetric(
          vertical: 12, horizontal: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$${donut.price.toString()}",
                  textScaleFactor: 1.4,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800)),
              const Text("*Delvery not included."),
            ],
          ),
          const Text(
            "Add to Cart",
            textScaleFactor: 1.3,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
