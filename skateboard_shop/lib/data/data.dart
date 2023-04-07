import 'dart:math';

class SkateBoard {
  final String name;
  final String by;
  final String price;
  final String description;
  final List<String> coreFeatures;
  final String fImage;
  final List<String> sizes;
  final String bImage;
  final Map<String, String> specs;

  SkateBoard({
    required this.name,
    required this.by,
    required this.price,
    required this.description,
    required this.coreFeatures,
    required this.fImage,
    required this.sizes,
    required this.bImage,
    required this.specs,
  });
}

final List<String> coreFeatures = [
  "100% Canadian Maple",
  "Stable and strong",
  "Great choice for beginners",
  "Comes with free grip tape",
  "Available in 7.5\", 7.75”, 8\", 8.25\", and 8.5\"",
  "ABEC-7 High-speed precision bearing",
  "Supports upto 220lbs (100KG)"
];

const String desc =
    "The Baybee 17 inch skateboards are constructed of 7 layers of maple wood deck which features high toughness and weight load, matching with heavy-duty aluminum alloy trucks providing you with strong reliable support. The max carrying weight of the skateboard is up to 30 Kg. The Anti-Shock 50mm 92A High Rebound PU car line wheels working with precision high-speed ABEC-9 bearings, provide you with a smooth and speedy riding experience. Besides, The skateboard equipped with the PU bushing that is of super shock absorption can effectively decrease the impact and protect your ankle. Suitable for commuting, ramp, skate park, street, pool, etc. The classic double kick concave design with high-density Non-Slip 80AB Emery grip tape gives your feet a more locked feeling, providing a safe experience and better control, perfect skateboard for beginners to easily learn more tricks.";

String note =
    "Note : Mix of Taxes and discount may change depending the amount of tax being borne by the Company. However, the final price as charged from customer will remain same. Taxes collected against every transaction will be paid to the Government by FirstCry.com. Please refer to the Terms of Use for full details.";

final List<String> availableSizes = [
  '7.25"',
  '7.5"',
  '7.75"',
  '8"',
  '8.25"',
  '8.25"',
  '8.5"',
  '8.75"',
];

final Map<String, String> spec = {
  'Ride Style': 'Carving',
  'Mounting Style': 'Drop Through',
  'Deck Thickness': '7-Ply',
  'Grip Type': 'Black Grip Tape',
  'Wheels': '69mm (78a) Offset Top Shelf Wheels',
  'Bearings': 'ABEC 5 Bearings',
};

List<String> boardNames = [
  'Dead Lover',
  'Kill-Monger',
  'Blue Wave',
  'स्केट (Skate)',
  'Yellow Heisenberg',
  'Alive Tonight'
];

List<String> boardFrontImages = [
  'dead_lover_front',
  'kill_monger_front',
  'blue_wave_front',
  'skate_front',
  'yellow_heisenberg_front',
  'tonight_alive_front'
];

List<String> boardBackImages = [
  'dead_lover_back',
  'kill_monger_back',
  'blue_wave_back',
  'skate_back',
  'yellow_heisenberg_back',
  'tonight_alive_back'
];

List<String> boardCompanies = [
  'Anti-Hero',
  'Powell Peralta',
  'Santa Cruz',
  'Polar Skate Co',
  'Krooked'
];

List<SkateBoard> allSkatesList = List.generate(
    6,
    (index) => SkateBoard(
        name: boardNames[index],
        by: boardCompanies[index % boardCompanies.length],
        price: (Random().nextInt(10) + 15).toString(),
        description: desc,
        coreFeatures: coreFeatures,
        fImage: assetName(boardFrontImages[index]),
        sizes: availableSizes,
        bImage: assetName(boardBackImages[index]),
        specs: spec));

String assetName(String image) => "assets/boards/$image.png";
