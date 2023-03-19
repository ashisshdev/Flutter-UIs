import 'package:flutter/material.dart';

class CustomSlideFadeTransition extends PageTransitionsBuilder {
  const CustomSlideFadeTransition();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // final tween = Tween(begin: 0.0, end: 1.0)
    //     .chain(CurveTween(curve: Curves.ease));
    return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        )
            .chain(CurveTween(curve: Curves.ease))
            .animate(animation),
        child: FadeTransition(opacity: animation, child: child));
  }
}
