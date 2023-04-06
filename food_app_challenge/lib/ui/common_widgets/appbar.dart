import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const AppAppBar({
    required this.appBar,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: SvgPicture.asset(
            'assets/icons/arrow_left.svg',
            semanticsLabel: 'Acme Logo',
            // ignore: deprecated_member_use
            color: Colors.pink,
            height: 10,
            width: 10,
          ),
        ),
      ),
      actions: [
        Container(
          decoration: const BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            'assets/icons/bag.svg',
            semanticsLabel: 'Acme Logo',
            // ignore: deprecated_member_use
            color: Colors.white,
            // height: 10,
            // width: 10,
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
