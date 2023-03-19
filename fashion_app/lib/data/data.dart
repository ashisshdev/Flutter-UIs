// list of categories
import 'package:fashion_app/models/category.dart';
import 'package:fashion_app/models/product.dart';
import 'package:fashion_app/utils/constants/app_assets.dart';

final categories = [
  const Category(
    categoryName: "T-SHIRT",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576871337622-98d48d1cf531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "SHOES",
    productCount: "120",
    thumbnailImage:
        "https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80",
  ),
  const Category(
    categoryName: "HODDIE",
    productCount: "200",
    thumbnailImage:
        "https://images.unsplash.com/photo-1647771746277-eac927afab2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "JEANS",
    productCount: "240",
    thumbnailImage:
        "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ),
];

// list of products
final products = [
  const Product(
    productName: "MNML - Oversized Tshirt",
    productImageUrl:
        "https://images.unsplash.com/photo-1588117305388-c2631a279f82?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80",
    currentPrice: "500",
    oldPrice: "700",
    isLiked: true,
  ),
  const Product(
    productName: "Crop Top Hoddie",
    productImageUrl:
        "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=720&q=80",
    currentPrice: "392",
    oldPrice: "400",
    isLiked: false,
  ),
  const Product(
    productName: "Half Tshirt",
    productImageUrl:
        "https://images.unsplash.com/photo-1529139574466-a303027c1d8b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    currentPrice: "204",
    oldPrice: "350",
    isLiked: true,
  ),
  const Product(
    productName: "Best Fit Women Outfit",
    productImageUrl:
        "https://images.unsplash.com/photo-1581044777550-4cfa60707c03?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    currentPrice: "540",
    oldPrice: "890",
    isLiked: true,
  ),
  const Product(
    productName: "Strip Tourser",
    productImageUrl:
        "https://images.unsplash.com/photo-1509631179647-0177331693ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80",
    currentPrice: "230",
    oldPrice: "750",
    isLiked: false,
  ),
  const Product(
    productName: "MNML - Jeans",
    productImageUrl:
        "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    currentPrice: "240",
    oldPrice: "489",
    isLiked: false,
  ),
  const Product(
    productName: "MNML - Jeans",
    productImageUrl:
        "https://images.unsplash.com/photo-1475178626620-a4d074967452?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=686&q=80",
    currentPrice: "240",
    oldPrice: "489",
    isLiked: false,
  ),
  const Product(
    productName: "Half Tshirt",
    productImageUrl:
        "https://images.unsplash.com/photo-1517298257259-f72ccd2db392?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
    currentPrice: "204",
    oldPrice: "350",
    isLiked: true,
  ),
];

List<String> modelsImages = [
  AppAssets.homePageAssets.fashionModel0,
  AppAssets.homePageAssets.fashionModel1,
  AppAssets.homePageAssets.fashionModel2,
  AppAssets.homePageAssets.fashionModel3,
  AppAssets.homePageAssets.fashionModel4,
  AppAssets.homePageAssets.fashionModel5,
  AppAssets.homePageAssets.fashionModel6,
  AppAssets.homePageAssets.fashionModel7,
];
