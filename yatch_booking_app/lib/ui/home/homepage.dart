import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:yatch_booking_app/data/dummy_data.dart';
import 'package:yatch_booking_app/models/boat_model.dart';
import 'package:yatch_booking_app/ui/details/detail_page.dart';

class BoatListPage extends StatefulWidget {
  const BoatListPage({Key? key}) : super(key: key);

  @override
  BoatListPageState createState() => BoatListPageState();
}

class BoatListPageState extends State<BoatListPage> {
  late PageController _pageController;
  late ValueNotifier<double> _pageNotifier;
  late ValueNotifier<bool> _hideAppBarNotifier;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: .7);
    _pageController.addListener(_pageListener);
    _pageNotifier = ValueNotifier(0.0);
    _hideAppBarNotifier = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    _pageNotifier.value = _pageController.page!;
  }

  //------------------------------------
  // Open Specs Boat Page
  //------------------------------------
  void _openSpecsPage(BuildContext context, Boat boat) async {
    _hideAppBarNotifier.value = true;
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 600),
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
              opacity: animation,
              child: BoatSpecsScreen(boat: boat),
            );
          },
        ));
    _hideAppBarNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //-----------------------------------
          // Custom App Bar
          //-----------------------------------
          SafeArea(
            child: ValueListenableBuilder<bool>(
                valueListenable: _hideAppBarNotifier,
                builder: (context, value, _) {
                  return _AnimatedCustomAppBar(animate: value);
                }),
          ),
          const SizedBox(height: 20),
          //------------------------------------
          // Boat Page View
          //------------------------------------
          Expanded(
            child: PageView.builder(
                controller: _pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: boatsData.length,
                itemBuilder: (context, index) {
                  final boat = boatsData[index];
                  return ValueListenableBuilder<double>(
                      valueListenable: _pageNotifier,
                      builder: (context, value, _) {
                        final factorChange = (value - index).abs();
                        return BoatCard(
                          boat: boat,
                          onTapSpec: () => _openSpecsPage(context, boat),
                          factorChange: factorChange,
                        );
                      });
                }),
          ),
        ],
      ),
    );
  }
}

class BoatCard extends StatelessWidget {
  const BoatCard({
    Key? key,
    required this.boat,
    required this.factorChange,
    required this.onTapSpec,
  }) : super(key: key);

  final Boat boat;
  final double factorChange;
  final VoidCallback onTapSpec;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: (1 - factorChange).clamp(0.0, 1.0),
      child: Column(
        children: [
          //-----------------------------
          // Image boat
          //-----------------------------
          Expanded(
            child: Transform.scale(
              alignment: const Alignment(0, .5),
              scale: lerpDouble(1.0, 0.7, factorChange)!,
              child: Hero(
                tag: boat.title,
                child: Image.asset(boat.urlImage),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            boat.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          //------------------------------
          // Owner boat
          //------------------------------
          Text.rich(
            TextSpan(
              text: 'By ',
              children: [
                TextSpan(
                  text: boat.by,
                  style: TextStyle(
                    color: Colors.grey[900],
                  ),
                ),
              ],
              style: TextStyle(color: Colors.grey[600], height: 1),
            ),
          ),
          //-----------------------------
          // See Specs Button
          //-----------------------------
          TextButton.icon(
            label: const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 16,
            ),
            icon: const Text('SPEC'),
            onPressed: onTapSpec,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                Colors.blue[900]!,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}

class _AnimatedCustomAppBar extends StatelessWidget {
  const _AnimatedCustomAppBar({
    Key? key,
    required this.animate,
  }) : super(key: key);

  final bool animate;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 600),
      transform: Matrix4.translationValues(0, animate ? -100 : 0, 0),
      child: AnimatedOpacity(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 600),
        opacity: animate ? 0 : 1,
        child: SizedBox(
          height: kToolbarHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Boats',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                  color: Colors.grey[800],
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
