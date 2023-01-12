// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AestheticLockScreen extends StatelessWidget {
  const AestheticLockScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://i.imgur.com/XNx0mye.gif"),
                        fit: BoxFit.cover)),
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Text(
                        "Welcome User",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                        borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
                      ),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            hintText: "E-mail",
                            hintStyle: TextStyle(color: Colors.white70, fontSize: 17)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.10),
                      ),
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.10),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: TextField(
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white70, fontSize: 17),
                            border: InputBorder.none),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                      child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white.withOpacity(0.30)),
                        ),
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
