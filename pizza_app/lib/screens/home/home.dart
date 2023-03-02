import 'package:flutter/material.dart';
import 'package:pizza_app/controllers/customize_pizza_controller.dart';
import 'package:pizza_app/data/fake_data.dart';
import 'package:pizza_app/models/data_models.dart';
import 'package:pizza_app/screens/pizza_customization/pizza_customize.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: TextButton(
          child: const Text("Go customize"),
          onPressed: () {
            final pizza = CustomPizza(
                pizzaSize: PizzaSize.L,
                pizza: allPizzas[1],
                addOnIngredients: [],
                price: allPizzas[1].price);
            Provider.of<CustomPizzaController>(context, listen: false)
                .initialiseMyCustomPizza(pizza);

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PizzaCustomize()));
          },
        ),
      )),
    );
  }
}
