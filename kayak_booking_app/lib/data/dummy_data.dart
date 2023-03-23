import 'package:kayak_booking_app/models/kayak.dart';

List<String> kayakNames = [
  "Lifetime Youth",
  "Sunny Island",
  "Pelican Athena",
  "Sun Dolphin",
  "Lifetime Athena ",
  "Sunny Island",
  "Pelican Youth",
];

List<Kayak> kayaks = List.generate(
    7,
    (index) =>
        Kayak(name: kayakNames[index], image: 'assets/kayaks/kayak${index + 1}.png'));
