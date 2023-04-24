class AppAssets {
  AppAssets._privateConstructor();

  static final AppAssets _instance = AppAssets._privateConstructor();

  factory AppAssets() {
    return _instance;
  }

  static HomePageAssets homePageAssets = const HomePageAssets();
  // static DonutAssets donutAssets = const DonutAssets();
  // static SmoothieAssets smoothieAssets = const SmoothieAssets();
}

class HomePageAssets {
  const HomePageAssets();
  // final List<String> theyNeedYourHelp = ['india'];
  final String theyNeedYourHelpAnimal = 'assets/items/animal.jpg';
  final String theyNeedYourHelpFarmer = 'assets/items/farmer.png';
  final String theyNeedYourHelpGirl = 'assets/items/girl.png';
  final String theyNeedYourHelpKid = 'assets/items/kid.jpg';
  final String theyNeedYourHelpUkraine = 'assets/items/ukraine.png';
}
