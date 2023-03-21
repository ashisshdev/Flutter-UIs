import 'package:coffee_shop/data/data.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../product_details/product_details.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Welcome, David',
            style: varelaBrown.copyWith(fontSize: 35, fontWeight: FontWeight.w900)),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(right: 45.0),
          child: Text(
            'Let\'s select the best taste for your next coffee break!',
            style: varelaLightBrown.copyWith(fontSize: 20, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}

class CategoryTitle extends StatelessWidget {
  final String title;
  const CategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: varelaBrown.copyWith(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: Text(
            'See all',
            style: varelaLightBrown.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}

class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  const CoffeeCard({
    super.key,
    required this.coffee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340.0,
        width: 250.0,
        padding: const EdgeInsets.only(left: 0.0, right: 25.0),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => DetailsPage(
            //           coffee: coffee,
            //         )));
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Details(
                      coffee: coffee,
                    )));
          },
          child: Column(
            children: <Widget>[
              Stack(children: [
                Container(height: 335.0),
                Positioned(
                  top: 75.0,
                  child: Container(
                    padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                    height: 260.0,
                    width: 225.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: const Color(0xFFDAB68C)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(
                          height: 60.0,
                        ),
                        Text(
                          '${coffee.shopName}\'s',
                          style: const TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          coffee.name,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(
                              fontFamily: 'varela',
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          coffee.description,
                          style: const TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              // fontWeight: FontWeight.w300,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              coffee.price,
                              style: const TextStyle(
                                  fontFamily: 'varela',
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF3A4742)),
                            ),
                            Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Colors.white),
                                child: Center(
                                    child: Icon(Icons.favorite,
                                        color: coffee.isLiked ? Colors.red : Colors.grey,
                                        size: 15.0)))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 35.0,
                  right: 20,
                  child: Hero(
                    tag: coffee.image,
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(coffee.image),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                )
              ]),
              const SizedBox(height: 10.0),
              Container(
                  height: 50.0,
                  width: 225.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: const Color(0xFF473D3A)),
                  child: const Center(
                      child: Text('Order Now',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))))
            ],
          ),
        ));
  }
}

class CoffeeShopCard extends StatelessWidget {
  final CoffeeShop coffeeShop;
  const CoffeeShopCard({super.key, required this.coffeeShop});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: Container(
        height: 100.0,
        width: 175.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          image: DecorationImage(image: AssetImage(coffeeShop.image), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
