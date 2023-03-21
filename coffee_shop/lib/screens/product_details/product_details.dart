import 'package:coffee_shop/data/data.dart';
import 'package:coffee_shop/utils/app_assets.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Coffee coffee;
  const DetailsPage({super.key, required this.coffee});

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Stack(
        children: <Widget>[
          Container(
              height: MediaQuery.of(context).size.height - 20.0,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFF3B2B7)),
          Positioned(
              top: MediaQuery.of(context).size.height / 2,
              child: Container(
                  height: MediaQuery.of(context).size.height / 2 - 20.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                      color: Colors.white))),

          //Content
          Positioned(
              top: MediaQuery.of(context).size.height / 2 + 25.0,
              left: 15.0,
              child: SizedBox(
                  height: (MediaQuery.of(context).size.height / 2) - 50.0,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(children: [
                    const Text(
                      'Preparation time',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF726B68)),
                    ),
                    const SizedBox(height: 7.0),
                    const Text(
                      '5min',
                      style: TextStyle(
                          fontFamily: 'nunito', fontSize: 14.0, color: Color(0xFFC6C4C4)),
                    ),
                    const SizedBox(height: 10.0),
                    //This is the line
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Container(
                        height: 0.5,
                        color: const Color(0xFFC6C4C4),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Ingredients',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF726B68)),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 110.0,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: coffeeIngredients
                              .map((e) => IngredientIcon(ingredient: e))
                              .toList(),
                        ),
                      ),
                    ),
                    //Line
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Container(
                        height: 0.5,
                        color: const Color(0xFFC6C4C4),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Nutrition Information',
                      style: TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF726B68)),
                    ),
                    const SizedBox(height: 10.0),
                    Row(children: const [
                      Text(
                        'Calories',
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 14.0,
                            color: Color(0xFFD4D3D2)),
                      ),
                      SizedBox(width: 15.0),
                      Text(
                        '250',
                        style: TextStyle(
                            fontFamily: 'nunito',
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF716966)),
                      ),
                    ]),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const <Widget>[
                        Text(
                          'Proteins',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color(0xFFD4D3D2)),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          '10g',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF716966)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      children: const <Widget>[
                        Text(
                          'Caffeine',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 14.0,
                              color: Color(0xFFD4D3D2)),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          '150mg',
                          style: TextStyle(
                              fontFamily: 'nunito',
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF716966)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15.0),
                    //Line
                    Padding(
                      padding: const EdgeInsets.only(right: 35.0),
                      child: Container(
                        height: 0.5,
                        color: const Color(0xFFC6C4C4),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Padding(
                        padding: const EdgeInsets.only(right: 25.0),
                        child: Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: const Color(0xFF473D3A)),
                          child: const Center(
                            child: Text(
                              'Make Order',
                              style: TextStyle(
                                  fontFamily: 'nunito',
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        )),
                    const SizedBox(height: 5.0)
                  ]))),
          Positioned(
              top: MediaQuery.of(context).size.height / 8,
              left: 105,
              child: Hero(
                tag: widget.coffee.image,
                child: Container(
                    height: 350.0,
                    width: 300.0,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.coffee.image),
                            alignment: Alignment.bottomRight,
                            fit: BoxFit.contain))),
              )),
          Positioned(
              top: 25.0,
              left: 15.0,
              child: SizedBox(
                  height: 300.0,
                  width: 250.0,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    //use a row with crossaxis as end
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(
                          width: 150.0,
                          child: Text('Caramel Macchiato',
                              style: TextStyle(
                                  fontFamily: 'varela',
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                        const SizedBox(width: 15.0),
                        Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white),
                            child: const Center(
                                child:
                                    Icon(Icons.favorite, size: 18.0, color: Colors.red)))
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    const SizedBox(
                      width: 170.0,
                      child: Text(
                          'Freshly steamed milk with vanilla-flavored syrup is marked with espresso and topped with caramel drizzle for an oh-so-sweet finish.',
                          style: TextStyle(
                              fontFamily: 'nunito', fontSize: 13.0, color: Colors.white)),
                    ),
                    const SizedBox(height: 20.0),
                    Row(children: [
                      Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: const Color(0xFF473D3A)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const <Widget>[
                              Text('4.2',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 13.0,
                                      color: Colors.white)),
                              Text('/5',
                                  style: TextStyle(
                                      fontFamily: 'nunito',
                                      fontSize: 13.0,
                                      color: Color(0xFF7C7573))),
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
                                          image:
                                              AssetImage(AppAssets.peopleAssets.person1),
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
                                    image: AssetImage(AppAssets.peopleAssets.person3),
                                    fit: BoxFit.cover),
                                border: Border.all(
                                    color: const Color(0xFFF3B2B7),
                                    style: BorderStyle.solid,
                                    width: 1.0)),
                          ),
                        ]),
                        const SizedBox(height: 3.0),
                        const Text(
                          '+ 27 more',
                          style: TextStyle(
                              fontFamily: 'nunito', fontSize: 12.0, color: Colors.white),
                        )
                      ])
                    ])
                  ])))
        ],
      )
    ]));
  }
}

class IngredientIcon extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientIcon({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Column(children: [
          Container(
            height: 50.0,
            width: 50.0,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: ingredient.color.withOpacity(0.7)),
            child: Center(
              child: Image.asset(
                ingredient.icon,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          const SizedBox(height: 4.0),
          SizedBox(
              width: 60.0,
              child: Center(
                  child: Text(ingredient.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'nunito',
                          fontSize: 12.0,
                          color: Color(0xFFC2C0C0)))))
        ]));
  }
}
