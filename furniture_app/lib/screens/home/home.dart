import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/screens/home/home_widgets.dart';
import 'package:furniture_app/utils/app_assets/app_assets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shadowColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppAssets.svgIcons.homepageAppBarMenu),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:
                SvgPicture.asset(AppAssets.svgIcons.searchBarIcon, height: 30, width: 30),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const SectionTile(title: "Trending Now"),
              SizedBox(
                height: h * 0.5,
                child: const TrendingItemsList(),
              ),
              const SizedBox(height: 30),
              const SectionTile(title: "New Arrivals"),
              const SizedBox(height: 20),
              const SizedBox(
                child: NewArrivalsList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
