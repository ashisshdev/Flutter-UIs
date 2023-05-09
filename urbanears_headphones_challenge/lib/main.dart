import 'package:flutter/material.dart';

/// inpired from https://dribbble.com/shots/3894781-Urbanears-Headphones

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Urbanears Headphones UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double pageValue = 0.0;
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();

    pageController = PageController(viewportFraction: 1, initialPage: 0);
    pageController.addListener(() {
      setState(() {
        pageValue = pageController.page ?? 0.0;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text("index = ${currentIndex.toString()}"),
            SizedBox(
              width: w,
              height: h * 0.7,
              child: PageView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                controller: pageController,
                final scale = 
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.red,
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        FlutterLogo(),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
