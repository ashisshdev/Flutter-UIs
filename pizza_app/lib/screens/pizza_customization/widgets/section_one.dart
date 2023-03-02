import 'package:flutter/material.dart';
import 'package:pizza_app/controllers/customize_pizza_controller.dart';
import 'package:pizza_app/models/data_models.dart';
import 'package:pizza_app/utils/assets.dart';
import 'package:pizza_app/utils/constants.dart';
import 'package:pizza_app/utils/helpers.dart';
import 'package:provider/provider.dart';

class SectionOne extends StatefulWidget {
  const SectionOne({
    Key? key,
  }) : super(key: key);

  @override
  State<SectionOne> createState() => _SectionOneState();
}

class _SectionOneState extends State<SectionOne>
    with SingleTickerProviderStateMixin {
  // late AnimationController ingredientAnimationController;
  List<TransformIngredient> transformations = [];

  @override
  void initState() {
    super.initState();
  }

  ingredientAcceptanceProcess({required Ingredient ingredient}) {
    transformations = [];
    transformations =
        List.generate(ingredient.positions.length, (index) {
      return TransformIngredient(
          from: getInitialOffset(
              finalOffset: ingredient.positions[index]),
          to: ingredient.positions[index]);
    });

    Provider.of<CustomPizzaController>(context, listen: false)
        .updateLatestIngredient(latestIngredient: ingredient);

  }

  List<Widget> positionedWidgets(PizzaSize pizzaSize,
      Ingredient ingredient, double xFactor, double yFactor) {
    List<Widget> allPositionedWidgets = [];
    for (int i = 0;
        i < numOfIngredientsBasedOnSize[pizzaSize]!;
        i++) {
      allPositionedWidgets.add(TweenAnimationBuilder(
        tween: Tween<Offset>(
            begin: transformations[i].from,
            end: transformations[i].to),
        duration: const Duration(milliseconds: 500),
        onEnd: () {
          if (i == numOfIngredientsBasedOnSize[pizzaSize]! - 1) {
            Provider.of<CustomPizzaController>(context, listen: false)
                .addIngredient(ingredient: ingredient);
            // change latestIngredient to null
            Provider.of<CustomPizzaController>(context, listen: false)
                .updateLatestIngredient(latestIngredient: null);
          }
        },
        builder: (context, value, child) {
          return Positioned(
            left: value.dx * xFactor,
            bottom: value.dy * yFactor,
            // Transform.translate(
            // offset: value,
            child: Container(
              height:
                  double.parse(ingredient.singleUnitSize.toString()),
              width:
                  double.parse(ingredient.singleUnitSize.toString()),
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(ingredient.singUnitImage)),
              ),
              child: Image.asset(ingredient.singUnitImage),
            ),
          );
        },
      ));
    }
    return allPositionedWidgets;
  }

  List<Widget> getAddOnIngredientsAnimation(
      {required PizzaSize pizzaSize,
      required double xFactor,
      required double yFactor}) {
    Ingredient? latestIngredient =
        Provider.of<CustomPizzaController>(context, listen: true)
            .latestAcceptedIngredient;

    return latestIngredient == null
        ? const <Widget>[SizedBox.expand()]
        : positionedWidgets(
            pizzaSize, latestIngredient, xFactor, yFactor);

    ///
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Consumer<CustomPizzaController>(
          builder: (context, customPizzaProvider, _) {
            return Flexible(
              child: DragTarget<Ingredient>(
                onAccept: (acceptedIngredient) {
                  customPizzaProvider.toggleIngredientFocus(
                      isFocused: false);
                  ingredientAcceptanceProcess(
                      ingredient: acceptedIngredient);
                },
                onLeave: (leavingIngredient) {
                  customPizzaProvider.toggleIngredientFocus(
                      isFocused: false);
                },
                onWillAccept: (willAcceptIngredient) {
                  if (!customPizzaProvider.containsIngredient(
                      ingredient: willAcceptIngredient!)) {
                    customPizzaProvider.toggleIngredientFocus(
                        isFocused: true);
                    return true;
                  }
                  return false;
                },
                builder: (context, candidateData, rejectedData) {
                  return LayoutBuilder(
                      builder: (context, constraints) {
                    final pizzaSize = pizzaSizes[customPizzaProvider
                            .myCustomPizza.pizzaSize]!
                        .toDouble();
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      height: customPizzaProvider
                              .isIngredientHoveringOverPizza
                          ? constraints.maxHeight
                          : constraints.maxHeight - 20,
                      width: customPizzaProvider
                              .isIngredientHoveringOverPizza
                          ? constraints.maxHeight
                          : constraints.maxHeight - 20,
                      curve: Curves.bounceIn,
                      child: AnimatedRotation(
                        duration: const Duration(milliseconds: 200),
                        turns: customPizzaProvider.turns,
                        child: Stack(
                          children: [
                            /// Pizza Plate
                            Padding(
                                padding: EdgeInsets.all(pizzaSize),
                                child: Image.asset(pizzaPlate)),

                            /// PIzza
                            Padding(
                              padding: EdgeInsets.all(10 + pizzaSize),
                              child: Image.asset(
                                customPizzaProvider
                                    .myCustomPizza.pizza.image,
                              ),
                            ),

                            /// Ingredients static
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxHeight,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(20 + pizzaSize),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20),
                                child: LayoutBuilder(
                                    builder: (context, constr) {
                                  return Stack(
                                      alignment: Alignment.topLeft,
                                      children: getAddOnIngredients(
                                          pizzaSize:
                                              customPizzaProvider
                                                  .myCustomPizza
                                                  .pizzaSize,
                                          ingredients:
                                              customPizzaProvider
                                                  .myCustomPizza
                                                  .addOnIngredients,
                                          xFactor: constr.maxWidth,
                                          yFactor: constr.maxHeight));
                                }),
                              ),
                            ),

                            /// Pizza Ingredients Animation
                            Container(
                              height: constraints.maxHeight,
                              width: constraints.maxHeight,
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.all(20 + pizzaSize),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(20),
                                child: LayoutBuilder(
                                    builder: (context, constr) {
                                  return Stack(
                                    alignment: Alignment.topLeft,
                                    children:
                                        getAddOnIngredientsAnimation(
                                            pizzaSize:
                                                customPizzaProvider
                                                    .myCustomPizza
                                                    .pizzaSize,
                                            xFactor: constr.maxWidth,
                                            yFactor:
                                                constr.maxHeight),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            );
          },
        ),
        Selector<CustomPizzaController, int>(
          selector: (context, provider) =>
              provider.myCustomPizza.price,
          builder: (context, pizzePrice, child) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: CurvedAnimation(
                        parent: animation
                            .drive(Tween<double>(begin: 0, end: 1)),
                        curve: Curves.easeInOutCubic),
                    child: child,
                  ),
                );
              },
              child: Text(
                "\$$pizzePrice",
                key: Key(pizzePrice.toString()),
                textScaleFactor: 2.8,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.brown),
              ),
            );
          },
        )
      ],
    );
  }
}

List<Widget> getAddOnIngredients(
    {required PizzaSize pizzaSize,
    required List<Ingredient> ingredients,
    required double xFactor,
    required double yFactor}) {
  List<Widget> ingredientWidgets = [];
  for (var ingre in ingredients) {
    for (int i = 0;
        i < numOfIngredientsBasedOnSize[pizzaSize]!;
        i++) {
      ingredientWidgets.add(Positioned(
        left: xFactor * ingre.positions[i].dx,
        bottom: yFactor * ingre.positions[i].dy,
        child: Container(
          height: double.parse(ingre.singleUnitSize.toString()),
          width: double.parse(ingre.singleUnitSize.toString()),
          decoration: BoxDecoration(
            color: Colors.transparent,
            image: DecorationImage(
                image: AssetImage(ingre.singUnitImage)),
          ),
          child: Image.asset(ingre.singUnitImage),
        ),
      ));
    }
  }
  return ingredientWidgets;
}

class TransformIngredient {
  Offset from;
  Offset to;
  TransformIngredient({
    required this.from,
    required this.to,
  });
}

Offset getInitialOffset({required Offset finalOffset}) {
  final x = finalOffset.dx;
  final y = finalOffset.dy;
  double newX;
  double newY;

  if (x <= 0.25) {
    newX = -20;
  } else if (x <= 0.35) {
    newX = -10;
  } else if (x <= 0.55) {
    newX = 0;
  } else if (x <= 0.65) {
    newX = 10;
  } else {
    newX = 20;
  }

  if (y <= 0.25) {
    newY = -20;
  } else if (y <= 0.35) {
    newY = -10;
  } else if (y <= 0.55) {
    newY = 0;
  } else if (y <= 0.65) {
    newY = 10;
  } else {
    newY = 20;
  }

  return Offset(newX, newY);
}
