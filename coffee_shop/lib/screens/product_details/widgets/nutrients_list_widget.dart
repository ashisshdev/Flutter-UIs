import 'package:coffee_shop/data/data.dart';
import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class NutrientsList extends StatelessWidget {
  const NutrientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: nutritions
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    e.name,
                    style: varelaLightBrown.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(width: 15.0),
                  Text(
                    e.amount,
                    style: varelaBrown.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
