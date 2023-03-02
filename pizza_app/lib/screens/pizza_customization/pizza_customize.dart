// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pizza_app/controllers/customize_pizza_controller.dart';
import 'package:pizza_app/screens/pizza_customization/widgets/section_two.dart';
import 'package:provider/provider.dart';

import 'widgets/section_one.dart';

class PizzaCustomize extends StatelessWidget {
  const PizzaCustomize({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.brown,
        ),
        title: Text(
          Provider.of<CustomPizzaController>(context, listen: false)
              .myCustomPizza
              .pizza
              .name,
          style: const TextStyle(
              fontSize: 28,
              color: Colors.brown,
              fontStyle: FontStyle.italic),
        ),
        actions: const [
          Icon(
            Icons.shopping_basket,
            color: Colors.brown,
          )
        ],
      ),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
            bottom: 50,
            right: 10,
            left: 10,
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(15))),
              elevation: 10,
              child: Column(
                children: const [
                  Expanded(child: SectionOne()),
                  Expanded(child: SectionTwo())
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            height: 60,
            width: 60,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: InkWell(
              onTap: () {},
              child: const AddToCartButton(),
            ),
          )
        ],
      )),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellow, Colors.orange])),
      child: const Icon(
        Icons.add_shopping_cart_rounded,
        size: 35,
      ),
    );
  }
}
