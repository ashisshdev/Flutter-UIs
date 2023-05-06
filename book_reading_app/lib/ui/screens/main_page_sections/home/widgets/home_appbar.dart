import 'package:book_reading_app/ui/theme/assets.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor: Colors.white),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Hello Daniel",
            textScaleFactor: 1.7,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Welcome back!",
            textScaleFactor: 0.9,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
          )
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 40, right: 5, bottom: 15),
          child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(AppAssets().homePageAssets.searchIcon)),
        ),
        Container(
          margin: const EdgeInsets.only(right: 10),
          height: 70,
          width: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.green,
          ),
          child: Stack(
            children: [
              const Positioned(
                left: 0,
                right: 0,
                bottom: 15,
                child: CircleAvatar(
                  radius: 28,
                  backgroundColor: mainColor,
                ),
              ),
              Positioned.fill(
                  child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(AppAssets().homePageAssets.userAvatar),
              )),
            ],
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
