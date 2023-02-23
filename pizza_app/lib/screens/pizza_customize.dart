// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pizza_app/controller.dart';
import 'package:provider/provider.dart';

import '../data.dart';

class PizzaCustomize extends StatelessWidget {
  final Pizza pizza;

  const PizzaCustomize({
    Key? key,
    required this.pizza,
  }) : super(key: key);

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
          pizza.name,
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
                children: [
                  Expanded(
                      child: PizzaDetails(
                    pizza: pizza,
                  )),
                  Expanded(
                      child: Column(
                    children: const [
                      ChooseSize(),
                      SizedBox(
                        height: 20,
                      ),
                      IngredientsSlide()
                    ],
                  ))
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

class ChooseSize extends StatelessWidget {
  const ChooseSize({super.key});

  @override
  Widget build(BuildContext context) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: PizzaSize.values
              .map((e) => InkWell(
                    onTap: () {
                      Provider.of<CustomPizzaController>(context)
                          .changePizzaSize(newPizzaSize: e);
                    },
                    child: Text(
                      e.toString(),
                      // if e == selectedSize
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23),
                    ),
                  ))
              .toList(),
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
            "Toppings : ",
            textScaleFactor: 1.5,
            style: TextStyle(),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: allIngredients
                .map((e) => Draggable(
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
                        e.image,
                        height: 60,
                        width: 60,
                      ),
                    ),
                    data: e,
                    child: IngredientIcon(e: e)))
                .toList(),
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

class PizzaDetails extends StatefulWidget {
  final Pizza pizza;

  const PizzaDetails({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  @override
  State<PizzaDetails> createState() => _PizzaDetailsState();
}

class _PizzaDetailsState extends State<PizzaDetails>
    with TickerProviderStateMixin {
  List<Ingredient> ingredients = [];
  bool _focused = false;
  int increasedPrice = 0;
  PizzaSize pizzaSize = PizzaSize.M;

  late AnimationController rotationController;

  void changePizzaSize(PizzaSize newSize) {
    if (newSize == pizzaSize) {
      // Do nothing
    } else {
      rotationController.forward(from: 0);
//      triggerRotationAndSizeAnimation();
    }
  }

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0.0,
        upperBound: 60.0);
  }

  // triggerRotationAndSizeAnimation(
  //     double from, double to, bool clockWise) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: DragTarget<Ingredient>(
            onAccept: (acceptedIngredient) {
              print("onAccept");
              print(acceptedIngredient.name);
              setState(() {
                _focused = false;
                ingredients.add(acceptedIngredient);
                increasedPrice += acceptedIngredient.price;
              });
            },
            onLeave: (leavingIngredient) {
              print("onLeave");
              // print(leavingIngredient.name);
              setState(() {
                _focused = false;
              });
            },
            onWillAccept: (willAcceptIngredient) {
              if (ingredients.contains(willAcceptIngredient)) {
                print("will not accept this");
                return false;
              } else {
                print("will accept this");
                setState(() {
                  _focused = true;
                });
                return true;
              }

              // print(willAcceptIngredient.name);
            },
            builder: (context, candidateData, rejectedData) {
              return LayoutBuilder(builder: (context, constraints) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  height: _focused
                      ? constraints.maxHeight
                      : constraints.maxHeight - 20,
                  child: AnimatedBuilder(
                      animation: rotationController,
                      builder: (context, snapshot) {
                        return Transform.rotate(
                          angle: rotationController.value,
                          child: Stack(
                            children: [
                              Image.asset(pizzaPlate),
                              Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Image.asset(
                                      widget.pizza.image)),
                            ],
                          ),
                        );
                      }),
                );
              });
            },
          ),
        ),
        AnimatedSwitcher(
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
            "\$${widget.pizza.price + increasedPrice}",
            key: Key(increasedPrice.toString()),
            textScaleFactor: 2.8,
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.brown),
          ),
        )
      ],
    );
  }
}
