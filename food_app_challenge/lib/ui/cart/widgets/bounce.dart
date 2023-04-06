import 'package:flutter/material.dart';

class BounceWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final double begin;

  const BounceWidget({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(seconds: 0),
    this.begin = 1.4,
  });

  @override
  _BounceWidgetState createState() => _BounceWidgetState();
}

class _BounceWidgetState extends State<BounceWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: widget.begin, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
        reverseCurve: Curves.ease,
      ),
    );
    // _controller.forward().then((value) => _controller.reverse());
    Future.delayed(widget.delay).then((value) => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
