import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'controllers/customize_pizza_controller.dart';

Color backgroundColor = const Color(0xFFEAE6DF);
Color button1Color = const Color(0xFFDCBC85);
Color button2Color = const Color(0xFFFFA200);

String onboardingChef = "assets/onboarding/chef.png";
String onboardingPizzaSample = "assets/onboarding/pizza.png";

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: Colors.black,
          systemNavigationBarDividerColor: Colors.black));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CustomPizzaController>(
            create: (_) => CustomPizzaController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pizza App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const OnboardPizza(),
      ),
    );
  }
}

class OnboardPizza extends StatelessWidget {
  const OnboardPizza({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 80,
            right: 20,
            child: Text(
              "Skip",
              textScaleFactor: 1.5,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black.withOpacity(0.65)),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: backgroundColor,
              height: screenHeight * 0.45,
              width: screenWidth,
            ),
          ),
          Positioned(
            left: 30,
            right: 0,
            bottom: screenHeight * 0.37,
            child: SizedBox(
              height: screenHeight * 0.50,
              child: Image.asset(onboardingChef),
            ),
          ),
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: screenHeight * 0.46,
                width: screenWidth,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 110,
                      width: 110,
                      child: Image.asset(onboardingPizzaSample),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                      "#Pizza for you",
                      textScaleFactor: 1.7,
                      style:
                          TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: button1Color,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Sign up with email",
                          textScaleFactor: 1.4,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: button2Color,
                            shape: const StadiumBorder()),
                        child: const Text(
                          "Sign up with google",
                          textScaleFactor: 1.4,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
