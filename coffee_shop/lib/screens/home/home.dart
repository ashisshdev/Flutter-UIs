// ignore_for_file: import_of_legacy_library_into_null_safe, avoid_unnecessary_containers

import 'package:coffee_shop/data/data.dart';
import 'package:coffee_shop/screens/home/widgets.dart';
import 'package:coffee_shop/utils/app_assets.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Colors.white,
        elevation: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kDarkBrownColor,
        unselectedItemColor: kLightBrownColor,
        iconSize: 35,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome, David',
                            style: varelaBrown.copyWith(
                                fontSize: 35, fontWeight: FontWeight.w900)),
                        const SizedBox(height: 10.0),
                        Padding(
                          padding: const EdgeInsets.only(right: 45.0),
                          child: Container(
                            child: Text(
                              'Let\'s select the best taste for your next coffee break!',
                              style: varelaLightBrown.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            image: DecorationImage(
                                image: AssetImage(AppAssets.peopleAssets.person2),
                                fit: BoxFit.cover)),
                      ))
                ],
              ),
              const SizedBox(height: 15.0),
              const SizedBox(height: 15.0),
              const CategoryTitle(title: "Taste of the week"),
              SizedBox(
                height: 410.0,
                width: w,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: coffees.length,
                  itemBuilder: (context, index) {
                    return CoffeeCard(
                      coffee: coffees[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 15.0),
              const CategoryTitle(title: "Explore nearby"),
              const SizedBox(height: 15.0),
              SizedBox(
                  height: 125.0,
                  width: w,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: shops.length,
                    itemBuilder: (context, index) {
                      return CoffeeShopCard(
                        coffeeShop: shops[index],
                      );
                    },
                  )),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
