import 'package:flutter/material.dart';
import 'package:travel_app_login_screen/screens/login/widgets/animated_boat.dart';
import 'package:travel_app_login_screen/screens/login/widgets/custom_text_field.dart';
import 'package:travel_app_login_screen/screens/login/widgets/wave_animation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                            'assets/images/login/travel1.png',
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


