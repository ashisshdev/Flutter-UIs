import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailsCategoryTitle extends StatelessWidget {
  final String title;
  const DetailsCategoryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: varelaBrown.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }
}
