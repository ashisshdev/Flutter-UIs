import 'dart:math';
import 'dart:ui';

import 'package:pizza_app/models/data_models.dart';

int randomIngredientPrice() => Random().nextInt(2) + 1;

int randomPizzaPrice() => Random().nextInt(5) + 10;

double doubleInRange() =>
    Random().nextDouble() * (0.75 - 0.15) + 0.15;

double randomDoubleOffset() =>
    double.parse(doubleInRange().toStringAsFixed(2));

List<Offset> randomIngredientOffsetsList() => List.generate(12,
    (index) => Offset(randomDoubleOffset(), randomDoubleOffset()));

num degreeToRADS(num deg) => (deg * pi) / 180.0;

/// Extentention for Making `Sorting Method` enum's elements readable for use in DropDownBox
extension StringExtension on String {
  String capitalizeSizeEnum() {
    return this[10].toUpperCase();
  }
}

Map<PizzaSize, int> numOfIngredientsBasedOnSize = {
  PizzaSize.S: 6,
  PizzaSize.M: 9,
  PizzaSize.L: 12,
};
