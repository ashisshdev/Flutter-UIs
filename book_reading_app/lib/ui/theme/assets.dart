class AppAssets {
  static final AppAssets _singleton = AppAssets._internal();

  factory AppAssets() {
    return _singleton;
  }

  AppAssets._internal();

  final HomePageAssets homePageAssets = const HomePageAssets();
  final Books books = const Books();
}

class HomePageAssets {
  const HomePageAssets();
  final BottomNavBarAssets bottomNavBarAssets = const BottomNavBarAssets();
  final String searchIcon = 'assets/icons/search.png';
  final String userAvatar = 'assets/user/avatar.png';
}

class BottomNavBarAssets {
  const BottomNavBarAssets();
  final String bottomNavHome = 'assets/bottomNavBar/home.png';
  final String bottomNavHomeActive = 'assets/bottomNavBar/homeActive.png';
}

class Books {
  const Books();
}
