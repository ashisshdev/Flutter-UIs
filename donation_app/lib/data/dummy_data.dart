import 'package:donation_app/models/item.dart';
import 'package:donation_app/ui/app_theme/app_assets.dart';

List<Item> theyNeedYourHelp = [
  Item(
      name: "Monkeys",
      category: "Animals",
      porgress: 23.0,
      country: "Ethiopia",
      image: AppAssets.homePageAssets.theyNeedYourHelpAnimal),
  Item(
      name: "Farmers",
      category: "People",
      porgress: 14.0,
      country: "India",
      image: AppAssets.homePageAssets.theyNeedYourHelpFarmer),
  Item(
      name: "Girls",
      category: "People",
      porgress: 7.0,
      country: "Pakistan",
      image: AppAssets.homePageAssets.theyNeedYourHelpGirl),
  Item(
      name: "Children",
      category: "People",
      porgress: 30.0,
      country: "Morocco",
      image: AppAssets.homePageAssets.theyNeedYourHelpKid),
  Item(
      name: "Ukraine",
      category: "Country",
      porgress: 72.0,
      country: "Ukraine",
      image: AppAssets.homePageAssets.theyNeedYourHelpUkraine)
];
