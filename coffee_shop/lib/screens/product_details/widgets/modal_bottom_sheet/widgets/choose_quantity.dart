import 'package:coffee_shop/utils/constants.dart';
import 'package:flutter/material.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Quantity",
          style: varelaBrown.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const CounterWidget()
      ],
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          child: CircleAvatar(
            radius: 16,
            backgroundColor: count >= 2 ? Colors.brown.shade200 : Colors.grey,
            child: Text(
              "-",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: varelaWhite.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: () {
            if (count > 1) {
              setState(() {
                count--;
              });
            }
          },
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            final position = Tween<Offset>(begin: const Offset(0, -1), end: Offset.zero)
                .animate(animation);
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: position,
                child: child,
              ),
            );
          },
          child: Text(
            count.toString(),
            textScaleFactor: 2.0,
            style: varelaBrown.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.brown.shade200,
            child: Text(
              "+",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: varelaWhite.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: () {
            setState(() {
              count++;
            });
          },
        ),
      ],
    );
  }
}
