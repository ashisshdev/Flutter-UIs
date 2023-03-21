import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class TemperatureWidget extends StatefulWidget {
  const TemperatureWidget({super.key});

  @override
  State<TemperatureWidget> createState() => _TemperatureWidgetState();
}

class _TemperatureWidgetState extends State<TemperatureWidget> {
  bool hotSelected = true;
  toggleTemp() {
    setState(() {
      hotSelected = !hotSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Temperature",
          style: varelaBrown.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(25),
              ),
              color: Colors.grey.shade300),
          child: Row(
            children: [
              InkWell(
                  onTap: () {
                    toggleTemp();
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: hotSelected
                        ? const SelectedTempChip(tempTitle: "Hot")
                        : const UnselectedTempChip(tempTitle: "Hot"),
                  )),
              InkWell(
                onTap: () {
                  toggleTemp();
                },
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: hotSelected
                      ? const UnselectedTempChip(tempTitle: "Cold")
                      : const SelectedTempChip(tempTitle: "Cold"),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class UnselectedTempChip extends StatelessWidget {
  final String tempTitle;
  const UnselectedTempChip({super.key, required this.tempTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Text(
        tempTitle,
        style: varelaWhite.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class SelectedTempChip extends StatelessWidget {
  final String tempTitle;
  const SelectedTempChip({super.key, required this.tempTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: kDarkBrownColor,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Text(
          tempTitle,
          style: varelaWhite.copyWith(fontWeight: FontWeight.bold),
        ));
  }
}
