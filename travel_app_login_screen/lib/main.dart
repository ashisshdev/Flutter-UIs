import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app_login_screen/wave_animation.dart';

import 'animated_boat.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black,
      systemNavigationBarDividerColor: Colors.black));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Travel(),
    );
  }
}

class Travel extends StatelessWidget {
  const Travel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WaveAnimation(
                  color: Colors.blue.withOpacity(0.2),
                  heightStartMin: 1.2,
                  heightStartMax: 1.2,
                  firstRiseStartMin: 1.1,
                  firstRiseStartMax: 1.45,
                  secondRiseStartMin: 1.1,
                  secondRiseStartMax: 1.4,
                  heightEndMin: 1.15,
                  heightEndMax: 1.35,
                  delay: 0,
                ),
              )),
          const Positioned(
              left: 0, right: 0, bottom: 215, child: AnimatedBoat()),
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WaveAnimation(
                  color: Colors.lightBlueAccent.withOpacity(0.8),
                ),
              )),
          Positioned(
              bottom: 0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: WaveAnimation(
                  color: Colors.lightBlueAccent.withOpacity(0.5),
                  heightStartMin: 1.22,
                  heightStartMax: 1.35,
                  firstRiseStartMin: 1.15,
                  firstRiseStartMax: 1.45,
                  secondRiseStartMax: 1.4,
                  heightEndMax: 1.4,
                  delay: 500,
                ),
              )),
          Positioned(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Stack(
                children: [
                  Positioned(
                      top: 10,
                      left: 0,
                      right: 0,
                      child: SizedBox(
                        child: Center(
                          child: Image.asset(
                            'assets/images/travel1.png',
                            fit: BoxFit.scaleDown,
                            alignment: Alignment.bottomCenter,
                            height: 150,
                            width: 180,
                          ),
                        ),
                      )),
                  const Positioned(
                    top: 180,
                    left: 30,
                    right: 30,
                    child: SizedBox(
                      child: CustomTextField(
                        prefixIconData: Icons.person,
                        hint: "username",
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 30,
                    right: 30,
                    top: 250,
                    child: SizedBox(
                      child: CustomTextField(
                        prefixIconData: Icons.vpn_key_rounded,
                        hint: "password",
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 30,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: const ButtonStyle(),
                            child: const Text(
                              "LOGIN",
                              textScaleFactor: 1.6,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const Text(
                            "Forgot Password?",
                            textScaleFactor: 0.8,
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ]));
  }
}

class CustomTextField extends StatelessWidget {
  final IconData prefixIconData;
  final String hint;

  const CustomTextField(
      {super.key, required this.prefixIconData, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            prefixIcon: Icon(
              prefixIconData,
              color: Colors.white,
            )),
      ),
    );
  }
}
