import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plants_app/models/plant_preview.dart';
import 'package:plants_app/utils/assets.dart';
import 'package:plants_app/utils/constants.dart';

class AppBarIcon extends StatelessWidget {
  final String svgPath;
  final String count;
  const AppBarIcon(
      {super.key, required this.svgPath, required this.count});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 60,
        width: 60,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 3,
              top: 4,
              left: 3,
              right: 4,
              child: Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10)),
                    border: Border.all(
                        width: 2,
                        color: const Color(0xFF748749))),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 7, right: 5, left: 5),
                  child: SvgPicture.asset(
                    svgPath,
                    colorFilter: const ColorFilter.mode(
                        kPrimaryColor, BlendMode.dst),
                  ),
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: Container(
                  height: 22,
                  width: 22,
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2, color: kPrimaryColor),
                  ),
                  child: Center(
                    child: Text(
                      count,
                      style: const TextStyle(
                          color: kPrimaryDarkColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ))
          ],
        ));
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width - 32,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintStyle: const TextStyle(),
          focusColor: Colors.black,
          focusedBorder: _border(kPrimaryDarkColor, 3),
          border: _border(kPrimaryColor, 1),
          enabledBorder: _border(kPrimaryColor, 2),
          hintText: 'Tulip',
          alignLabelWithHint: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
                top: 10, right: 5, left: 5, bottom: 5),
            child: SvgPicture.asset(
              AppAssets.svgIcons.searchBarIcon,
              colorFilter: const ColorFilter.mode(
                  kPrimaryColor, BlendMode.dst),
            ),
          ),
        ),
        onFieldSubmitted: (value) {},
      ),
    );
  }

  OutlineInputBorder _border(Color color, double width) =>
      OutlineInputBorder(
        borderSide: BorderSide(width: width, color: color),
        borderRadius: BorderRadius.circular(12),
      );
}

class TabIcon extends StatelessWidget {
  final String text;
  final bool isSelected;

  const TabIcon({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 10),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          border: Border.all(color: kPrimaryColor, width: 2)),
      child: Text(
        text,
        textScaleFactor: 1.3,
        style: TextStyle(
            color: isSelected ? Colors.white : kPrimaryColor,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}

class PlantCard extends StatelessWidget {
  final PlantPreview plant;

  const PlantCard({super.key, required this.plant});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: const Card(
                color: Colors.white,
                elevation: 5,
              ),
            )),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(plant.image),
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.name,
                    textScaleFactor: 1.3,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${plant.price.toString()}",
                        textScaleFactor: 1.2,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        plant.price == 10
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: kPrimaryColor,
                      )
                      // SvgPicture.asset(
                      //   AppAssets.svgIcons.heartIcon,
                      //   colorFilter: const ColorFilter.mode(
                      //       kPrimaryColor, BlendMode.dst),
                      // )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
