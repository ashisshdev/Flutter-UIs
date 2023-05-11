import 'package:flutter/material.dart';
import 'package:urbanears_headphones_challenge/data/dummy_data.dart';
import 'package:urbanears_headphones_challenge/ui/screens/more_details/widgets.dart';

class DetailPage extends StatefulWidget {
  final Headphone headphone;

  const DetailPage({super.key, required this.headphone});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late Headphone headphone;

  @override
  void initState() {
    super.initState();
    headphone = widget.headphone;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: headphone.cLight,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      for (int i = 0; i < headphone.name.length; i++) ...[
                        TweenAnimationBuilder<double>(
                          tween: Tween(begin: 1, end: 0),
                          duration: Duration(milliseconds: 200 + (100 * i)),
                          builder: (context, value, child) {
                            return Transform.translate(
                                offset: Offset(0, -value * 100),
                                child: Text(
                                  headphone.name[i],
                                  textScaleFactor: 3.0,
                                  style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
                                ));
                          },
                        )
                      ],
                    ],
                  ),
                  TweenAnimationBuilder<double>(
                    tween: Tween(begin: 1, end: 0),
                    duration: const Duration(milliseconds: 700),
                    builder: (context, value, child) {
                      return Transform.translate(
                          offset: Offset(0, -value * 30),
                          child: Opacity(
                            opacity: 1 - value,
                            child: Text(
                              headphone.colorName,
                              textScaleFactor: 1.8,
                              style: TextStyle(fontWeight: FontWeight.w500, color: headphone.cDark),
                            ),
                          ));
                    },
                  ),
                ],
              ),
            ),

            Center(
              child: InkWell(
                enableFeedback: false,
                onTap: () {
                  Navigator.pop(context);
                },
                child: Hero(
                  tag: headphone.image,
                  child: InteractiveViewer(
                    maxScale: 2,
                    minScale: 1,
                    child: Image.asset(
                      headphone.image,
                      // height: h * 0.4,
                      // width: w * 0.75,
                    ),
                  ),
                ),
              ),
            ),
            // const Spacer(),
            Center(
              child: SizedBox(
                height: h * 0.2,
                width: w * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Expanded(
                      flex: 4,
                      child: AdvertisingVideoCard(),
                    ),
                    Expanded(
                      flex: 7,
                      child: ImageCard(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
