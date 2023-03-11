import 'package:flutter/material.dart';

/// inpired from
/// https://www.figma.com/file/5mLt9cH3IGhQ90ZSVmd7D6/Pizza-Delivery-App-(Community)?node-id=1%3A175&t=cO7lmhtL5XkR6RiD-0

class PizzaOnboarding extends StatelessWidget {
  const PizzaOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight =
        MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
              )),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.45,
              width: screenWidth,
              color: backgroundColor,
            ),
          ),
          Positioned(
            left: 30,
            right: 0,
            bottom: screenHeight * 0.37,
            child: SizedBox(
              height: screenHeight * 0.50,
              child: Image.asset(
                onboardingChef,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              height: screenHeight * 0.46,
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: Image.asset(onboardingPizzaSample)),
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
                        'Sign up with Email',
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
                        'Sign up with Google',
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
            ),
          ),
        ],
      ),
    );
  }
}

Color backgroundColor = const Color(0xFFEAE6DF);
Color button1Color = const Color(0xFFDCBC85);
Color button2Color = const Color(0xFFFFA200);

String onboardingChef = "assets/onboarding/chef.png";
String onboardingPizzaSample = "assets/onboarding/pizza.png";
