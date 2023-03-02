import 'package:flutter/material.dart';
import 'package:pizza_app/controllers/customize_pizza_controller.dart';
import 'package:pizza_app/data/fake_data.dart';
import 'package:pizza_app/models/data_models.dart';
import 'package:pizza_app/utils/helpers.dart';
import 'package:provider/provider.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ChooseSize(),
        SizedBox(
          height: 20,
        ),
        IngredientsSlide()
      ],
    );
  }
}

/// Helper widgets

class ChooseSize extends StatelessWidget {
  const ChooseSize({super.key});

  @override
  Widget build(BuildContext context) {
    final provider =
        Provider.of<CustomPizzaController>(context, listen: false);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 15),
          child: Text(
            "Size : ",
            textScaleFactor: 1.5,
            style: TextStyle(),
          ),
        ),
        Selector<CustomPizzaController, PizzaSize>(
          selector: (context, provider) =>
              provider.myCustomPizza.pizzaSize,
          builder: (context, size, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: PizzaSize.values
                  .map((e) => InkWell(
                        onTap: () {
                          provider.changePizzaSize(newPizzaSize: e);
                        },
                        child: Text(
                          e.toString().capitalizeSizeEnum(),
                          // if e == selectedSize
                          style: size == e
                              ? const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 33)
                              : const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class IngredientsSlide extends StatelessWidget {
  const IngredientsSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, left: 10, bottom: 10),
          child: Text(
            "Additional Toppings : ",
            textScaleFactor: 1.5,
            style: TextStyle(),
          ),
        ),
        SizedBox(
          child: Selector<CustomPizzaController, int>(
            selector: (context, provider) =>
                provider.myCustomPizza.addOnIngredients.length,
            builder: (context, value, child) {
              return SizedBox(
                width: MediaQuery.of(context).size.width * 0.95,
                height: 65,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: allIngredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ingredient = allIngredients[index];
                    return Provider.of<CustomPizzaController>(context,
                                listen: false)
                            .containsIngredient(
                                ingredient: ingredient)
                        ? InkWell(
                            onTap: () {
                              Provider.of<CustomPizzaController>(
                                      context,
                                      listen: false)
                                  .removeIngredient(
                                      ingredient: ingredient);
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle),
                              child: Stack(
                                children: [
                                  IngredientIcon(e: ingredient),
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red
                                              .withOpacity(0.4),
                                          shape: BoxShape.circle),
                                      child: const Icon(Icons.delete),
                                    ),
                                  )
                                ],
                              ),
                            ))
                        : Tooltip(
                            message:
                                "${ingredient.name}  \$${ingredient.price}",
                            child: Draggable(
                                feedback: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 0.0,
                                          blurRadius: 10.0,
                                          offset: Offset(0.0, 10.0),
                                          color: Colors.black26)
                                    ],
                                  ),
                                  child: Image.asset(
                                    ingredient.image,
                                    height: 60,
                                    width: 60,
                                  ),
                                ),
                                data: ingredient,
                                child: IngredientIcon(e: ingredient)),
                          );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class IngredientIcon extends StatelessWidget {
  final Ingredient e;

  const IngredientIcon({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      height: 60,
      width: 60,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Color(0xFFF5DEE3)),
          ),
          Image.asset(e.image),
        ],
      ),
    );
  }
}
