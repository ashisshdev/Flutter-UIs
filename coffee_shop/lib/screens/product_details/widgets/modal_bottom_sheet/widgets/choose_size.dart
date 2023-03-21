import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  String selectedSize = "M";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Select Size",
          style: varelaBrown.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: sizes.map((e) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: () {
                  if (selectedSize != e) {
                    setState(() {
                      selectedSize = e;
                    });
                  }
                },
                child: SizeLabel(
                  selectedSize: selectedSize,
                  size: e,
                ),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

List sizes = ["S", "M", "L"];

class SizeLabel extends StatelessWidget {
  final String selectedSize;
  final String size;
  const SizeLabel({
    Key? key,
    required this.selectedSize,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      size,
      style: selectedSize == size
          ? varelaBrown.copyWith(fontSize: 22, fontWeight: FontWeight.w700)
          : varelaLightBrown.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}
