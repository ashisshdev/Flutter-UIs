import 'package:fast_food_app/data/dummy_data.dart';
import 'package:fast_food_app/models/donut.dart';
import 'package:fast_food_app/ui/home/tabs/common_widgets_in_tabs.dart';
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
                child: ItemAddToCart(price: donut.price)),
          ],
        ),
      ),
    );
  }
}

