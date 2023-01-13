import 'package:flutter/material.dart';

class AnimatedBoat extends StatefulWidget {
  const AnimatedBoat({Key? key}) : super(key: key);

  @override
  _AnimatedBoatState createState() =>
      _AnimatedBoatState();
}

class _AnimatedBoatState extends State<AnimatedBoat>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);

    _animation = Tween(
            begin: const Offset(0, 0.37),
            end: const Offset(0, 0.30))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Image.asset(
        'assets/images/sailboat'
        '.png',
        height: 250,
        width: 150,
      ),
    );
  }
}
