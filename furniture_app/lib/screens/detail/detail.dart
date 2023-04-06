import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/data/data.dart';
import 'package:furniture_app/screens/detail/detail_widgets.dart';
import 'package:furniture_app/utils/app_assets/app_assets.dart';

class DetailPage extends StatelessWidget {
  final Product product = myProduct;

  DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(AppAssets.svgIcons.homepageAppBarMenu),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(
              Icons.center_focus_weak_rounded,
              size: 30,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.45,
              width: w,
              child: ImageSection(
                product: product,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.furniture.name,
                            textScaleFactor: 1.7,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            " by ${product.furniture.by}",
                            textScaleFactor: 1.2,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            product.furniture.price,
                            textScaleFactor: 2.0,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(1, 1),
                                    blurRadius: 5,
                                    color: Colors.black54)
                              ],
                            ),
                            child: product.furniture.isLiked
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 35,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    size: 35,
                                  ),
                          ),
                          const SizedBox(height: 10),
                          RatingBarIndicator(
                            // rating: product.furniture.rating,
                            rating: 4.5,
                            itemBuilder: (context, index) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 25.0,
                            // direction: Axis.vertical,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "fabric color",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          Text(
                            "Blue",
                            textScaleFactor: 1.4,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "style",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          Text(
                            "Comfortable",
                            textScaleFactor: 1.4,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "made in",
                            textScaleFactor: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, color: Colors.grey),
                          ),
                          Text(
                            "Russia",
                            textScaleFactor: 1.4,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${product.furniture.description} ${product.furniture.description}",
                    textScaleFactor: 1.1,
                    style: TextStyle(height: 1.2, color: Colors.black.withOpacity(0.7)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}