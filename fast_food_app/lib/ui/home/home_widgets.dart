import 'package:fast_food_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

class IWantToEat extends StatelessWidget {
  const IWantToEat({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: const [
          Text(
            ' I want to',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            ' EAT',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class TabIcon extends StatelessWidget {
  final TabBarItem item;
  final bool isSelected;

  const TabIcon({
    Key? key,
    required this.item,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 90,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: isSelected
                          ? Colors.black
                          : Colors.grey[300]!,
                      width: 2)),
              child: Image.asset(
                item.image,
                color: isSelected ? Colors.black87 : Colors.black54,
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              item.name,
              textScaleFactor: isSelected ? 0.9 : 0.8,
              style: TextStyle(
                  color: isSelected ? Colors.black : Colors.black54),
            )
          ],
        ),
      ),
    );
  }
}

class ViewCart extends StatelessWidget {
  const ViewCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          border: Border.all(color: Colors.black54, width: 3)),
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('2 Items | \$45',
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.w800)),
              Text("+ Delvery charges."),
            ],
          ),
          const Text(
            "View Cart",
            textScaleFactor: 1.3,
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
