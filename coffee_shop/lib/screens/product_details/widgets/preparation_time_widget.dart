import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';


class PreparationTime extends StatelessWidget {
  const PreparationTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Preparation Time",
            style: varelaBrown.copyWith(fontSize: 19, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            "5 Min",
            style: varelaBrown.copyWith(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
