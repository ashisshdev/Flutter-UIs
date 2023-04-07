import 'package:flutter/material.dart';
import 'package:skateboard_shop/data/data.dart';
import 'package:skateboard_shop/ui/screens/detail/widgets.dart';

class DetailPage extends StatelessWidget {
  final SkateBoard board;
  const DetailPage({super.key, required this.board});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.2,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 10,
                      top: 10,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                            padding: const EdgeInsets.all(3),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey, blurRadius: 3, spreadRadius: 4)
                                ]),
                            child: const Icon(
                              Icons.close,
                              size: 30,
                            )),
                      ),
                    ),

                    /// If I want to bounce the cross icon
                    // TweenAnimationBuilder(
                    //   tween: Tween<double>(begin: 1, end: 0),
                    //   duration: const Duration(milliseconds: 600),
                    //   curve: Curves.bounceInOut,
                    //   builder: (context, value, child) {
                    //     return Positioned(
                    //         left: 10,
                    //         top: value * 1000 + 10,
                    //         child: const Icon(Icons.close));
                    //   },
                    // ),
                    Positioned(
                      right: w * 0.40,
                      child: Container(
                        margin: const EdgeInsets.only(top: 60),
                        child: HeroSkate(board: board),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 20,
              ),

              /// Boat name and by
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: board.name,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                "${board.name} ",
                                textScaleFactor: 2.5,
                                maxLines: 2,
                                style: const TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Hero(
                            tag: board.by,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text.rich(
                                textScaleFactor: 1.5,
                                TextSpan(
                                  text: 'by ',
                                  children: [
                                    TextSpan(
                                      text: "${board.by} ",
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.75),
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                  style: TextStyle(color: Colors.grey[600], height: 1),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\$",
                          textScaleFactor: 1.5,
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          board.price,
                          textScaleFactor: 3,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0),
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, value * -1000),
                    child: Opacity(
                      opacity: 1 - value,
                      child: child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AvailableSizes(availableSizes: board.sizes),
                      const SizedBox(height: 25),
                      CoreFeatures(features: board.coreFeatures),
                      const SizedBox(height: 25),
                      Description(text: board.description),
                      const SizedBox(height: 25),
                      SpecsTable(specification: board.specs),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class SpecsTable extends StatelessWidget {
  final Map<String, String> specification;
  const SpecsTable({super.key, required this.specification});

  @override
  Widget build(BuildContext context) {
    print(specification);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Specifications : ",
          textScaleFactor: 1.4,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Container(
          margin: const EdgeInsets.only(left: 2, right: 30, top: 3, bottom: 3),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade500, width: 1.2),
              borderRadius: const BorderRadius.all(Radius.circular(3))),
          child: Column(
            children: [
              for (final item in specification.keys) ...[
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            " $item",
                            textScaleFactor: 1.3,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                        ),
                        Expanded(
                            child: Text(
                          specification[item]!,
                          textScaleFactor: 1.3,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.65)),
                        ))
                      ],
                    ),
                    const Divider(
                      thickness: 1.1,
                    ),
                  ],
                )
              ]
            ],
          ),
        )
      ],
    );
  }
}
