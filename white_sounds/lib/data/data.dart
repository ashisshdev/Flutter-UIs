class Collection {
  String name;
  String tagLine;
  String image;
  String numberOfItems;
  String logo;
  Collection({
    required this.name,
    required this.tagLine,
    required this.image,
    required this.numberOfItems,
    required this.logo,
  });
}

class Sound {
  String name;
  String image;
  String length;
  Sound({
    required this.name,
    required this.image,
    required this.length,
  });
}

List<Collection> allCollections = [
  Collection(
    name: "Rain",
    tagLine: "Immersed in the\nrain",
    image: "assets/collections/images/rain.jpg",
    numberOfItems: '08',
    logo: 'assets/collections/icons/icon_rain.png',
  ),
  Collection(
    name: "Forest",
    tagLine: "Being in the\nforest",
    image: "assets/collections/images/forest.jpg",
    numberOfItems: '04',
    logo: 'assets/collections/icons/icon_forest.png',
  ),
  Collection(
    name: "Ocean",
    tagLine: "Deep in the\ndepths",
    image: "assets/collections/images/ocean.jpg",
    numberOfItems: '12',
    logo: 'assets/collections/icons/icon_ocean.png',
  ),
  Collection(
    name: "Thunder",
    tagLine: "Calmness before\nchaos",
    image: "assets/collections/images/thunder.jpg",
    numberOfItems: '05',
    logo: 'assets/collections/icons/icon_thunder.png',
  ),
  Collection(
    name: "Nature",
    tagLine: "Serenity of oneness\nin all",
    image: "assets/collections/images/nature.jpg",
    numberOfItems: '10',
    logo: 'assets/collections/icons/icon_nature.png',
  ),
];

List<Sound> allSounds = [
  Sound(name: "Sound of Wind", image: 'assets/sounds/wind.jpg', length: '135s'),
  Sound(name: "Flowing River", image: 'assets/sounds/river.jpg', length: '195s'),
  Sound(name: "Bird Cry", image: 'assets/sounds/bird.jpg', length: '150s'),
  Sound(name: "The chirp of\nInsects", image: 'assets/sounds/bug.jpg', length: '122s'),
  Sound(name: "Falling Water", image: 'assets/sounds/waterfall.jpg', length: '160s'),
];

Collection selectedCollection = allCollections[1];