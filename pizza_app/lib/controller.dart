import 'package:flutter/material.dart';
import 'package:pizza_app/data.dart';

class CustomPizzaController extends ChangeNotifier {
  String pizzaSize = ;
  bool runRotationAnimation = false;

  changePizzaSize({required String newPizzaSize}) {
    String pizzaSize = newPizzaSize;
    int pizzaSizeNumber = pizzaSizeNumbers[];

    notifyListeners();
    rotaionAnimationStartStop();
  }

  rotaionAnimationStartStop() {
    runRotationAnimation = !runRotationAnimation;
    notifyListeners();
  }
}
