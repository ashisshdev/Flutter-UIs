import 'package:flutter/material.dart';
import 'package:pizza_app/screens/home/home.dart';
import 'package:provider/provider.dart';

import 'controllers/customize_pizza_controller.dart';

void main() {
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
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
