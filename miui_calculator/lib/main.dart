import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CalculatorUI());
  }
}

class CalculatorUI extends StatelessWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 20),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Calculator",
                    style: titleStyle.copyWith(
                        color: Colors
                            .orangeAccent.shade700),
                  ),
                  Text(
                    "Life",
                    style: titleStyle,
                  ),
                  Text(
                    "Finance",
                    style: titleStyle,
                  ),
                  const Icon(
                    Icons.more_vert,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                Row(
                  children: [
                    SymbolButton(
                      symbol: "C",
                      onTap: () {},
                      widgetColor:
                          Colors.orangeAccent.shade700,
                    ),
                    IconButton(
                        child:
                            Icons.backspace_outlined,
                        onTap: () {}),
                    SymbolButton(
                        symbol: "%", onTap: () {}),
                    SymbolButton(
                        symbol: "/", onTap: () {}),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 3 *
                          getDeviceWidth(context, 20),
                      width: 3 *
                          getDeviceWidth(context, 25),
                      child: GridView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio:
                                      5 / 4,
                                  crossAxisCount: 3),
                          itemBuilder:
                              (context, index) {
                            return NumberButton(
                                number: index + 1,
                                onTap: () {});
                          }),
                    ),
                    Column(
                      children: [
                        SymbolButton(
                            symbol: "*", onTap: () {}),
                        SymbolButton(
                            symbol: "-", onTap: () {}),
                        SymbolButton(
                            symbol: "+", onTap: () {}),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      child:
                          Icons.swap_horizontal_circle,
                      onTap: () {},
                      widgetColor:
                          Colors.orangeAccent.shade700,
                    ),
                    NumberButton(
                        number: 0, onTap: () {}),
                    SymbolButton(
                        symbol: ".", onTap: () {}),
                    SymbolButton(
                      symbol: "=",
                      onTap: () {},
                      widgetColor: Colors.white,
                      backgroundColor:
                          Colors.orangeAccent.shade700,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// + - / * % . = C
class SymbolButton extends StatelessWidget {
  final String symbol;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color widgetColor;

  const SymbolButton(
      {Key? key,
      required this.symbol,
      this.backgroundColor = Colors.white,
      this.widgetColor = Colors.black87,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getDeviceWidth(context, 25),
        height: getDeviceWidth(context, 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
              color: Colors.black38, width: 0.5),
        ),
        child: Center(
            child: Text(
          symbol.toString(),
          textScaleFactor: 3.0,
          style: TextStyle(
              color: widgetColor,
              fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}

// 0 1 2 3 4 5 6 7 8 9
class NumberButton extends StatelessWidget {
  final int number;
  final VoidCallback onTap;

  const NumberButton(
      {Key? key,
      required this.number,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: getDeviceWidth(context, 25),
        height: getDeviceWidth(context, 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Colors.black38, width: 0.5),
        ),
        child: Center(
            child: Text(
          number.toString(),
          textScaleFactor: 3.0,
          style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontWeight: FontWeight.w300),
        )),
      ),
    );
  }
}

// toggle view icon
class IconButton extends StatelessWidget {
  final IconData child;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color widgetColor;

  const IconButton({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.widgetColor = Colors.black87,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          width: getDeviceWidth(context, 25),
          height: getDeviceWidth(context, 20),
          decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(
                  color: Colors.black38, width: 0.5)),
          child: Icon(
            child,
            color: widgetColor,
          ),
        ));
  }
}

TextStyle titleStyle = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20);

double getDeviceWidth(context, int percentage) =>
    MediaQuery.of(context).size.width *
    percentage /
    100;

double getDeviceHeight(context, int percentage) =>
    MediaQuery.of(context).size.height *
    percentage /
    100;
