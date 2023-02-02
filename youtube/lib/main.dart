import 'package:flutter/material.dart';
import 'package:youtube/youtube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Lmao(),
    );
  }
}

class Lmao extends StatelessWidget {
  const Lmao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Expanded(
                  child: Hero(
                    tag: 'mac10!',
                    child: Image.network(
                      'http://cachemonet.com/src/center/uzi.gif',
                      scale: 1.6,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
