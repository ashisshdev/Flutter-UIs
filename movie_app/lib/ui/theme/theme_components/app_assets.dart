class AppAssets {
  static final AppAssets _instance = AppAssets._internal();
  factory AppAssets() => _instance;

  AppAssets._internal() {
    /// any initialization logic
  }
}

class BottomNavBarIcons {
  final String home = 'assets/icons/bottom_nav/home.svg';
  final String search = 'assets/icons/bottom_nav/search.svg';
  final String wish = 'assets/icons/bottom_nav/wish.svg';
  final String profile = 'assets/icons/bottom_nav/profile.svg';
}

class ButtonIcons {
  final String plus = 'assets/icons/button/plus.svg';
}
