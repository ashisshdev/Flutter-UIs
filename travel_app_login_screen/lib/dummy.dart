import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DummyTravelApp extends StatefulWidget {
  const DummyTravelApp({super.key});

  @override
  State<DummyTravelApp> createState() => _DummyTravelAppState();
}

class _DummyTravelAppState extends State<DummyTravelApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

List<IconData> _icons = [
  FontAwesomeIcons.plane,
  FontAwesomeIcons.bed,
  FontAwesomeIcons.streetView,
  FontAwesomeIcons.personBiking,
];
