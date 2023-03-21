import 'package:coffee_shop/utils/app_assets.dart';
import 'package:flutter/material.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0), color: const Color(0xFF473D3A)),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('4.2',
                  style: TextStyle(
                      fontFamily: 'nunito', fontSize: 13.0, color: Colors.white)),
              Text('/5',
                  style: TextStyle(
                      fontFamily: 'nunito', fontSize: 13.0, color: Color(0xFF7C7573))),
            ],
          ))),
      const SizedBox(width: 15.0),
      Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(children: [
          const SizedBox(height: 35.0, width: 80.0),
          Positioned(
              left: 40.0,
              child: Container(
                  height: 35.0,
                  width: 35.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.5),
                      border: Border.all(
                          color: const Color(0xFFF3B2B7),
                          style: BorderStyle.solid,
                          width: 1.0),
                      image: DecorationImage(
                          image: AssetImage(AppAssets.peopleAssets.person1),
                          fit: BoxFit.cover)))),
          Positioned(
            left: 20.0,
            child: Container(
              height: 35.0,
              width: 35.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17.5),
                  image: DecorationImage(
                      image: AssetImage(AppAssets.peopleAssets.person2),
                      fit: BoxFit.cover),
                  border: Border.all(
                      color: const Color(0xFFF3B2B7),
                      style: BorderStyle.solid,
                      width: 1.0)),
            ),
          ),
          Container(
            height: 35.0,
            width: 35.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.5),
                image: DecorationImage(
                    image: AssetImage(AppAssets.peopleAssets.person3), fit: BoxFit.cover),
                border: Border.all(
                    color: const Color(0xFFF3B2B7),
                    style: BorderStyle.solid,
                    width: 1.0)),
          ),
        ]),
        const SizedBox(height: 3.0),
        const Text(
          '+ 27 more',
          style: TextStyle(fontFamily: 'nunito', fontSize: 12.0, color: Colors.white),
        )
      ])
    ]);
  }
}
