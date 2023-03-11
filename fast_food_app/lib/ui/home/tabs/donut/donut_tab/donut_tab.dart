import 'package:fast_food_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

import 'donut_tab_widgets.dart';

class DonutTab extends StatefulWidget {
  const DonutTab({super.key});

  @override
  State<DonutTab> createState() => _DonutTabState();
}

class _DonutTabState extends State<DonutTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: donuts.length,
            padding: const EdgeInsets.all(12),
            shrinkWrap: true,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
            ),
            itemBuilder: (context, index) {
              return DonutCard(
                donut: donuts[index],
              );
            },
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
