import 'package:fast_food_app/data/dummy_data.dart';
import 'package:fast_food_app/ui/home/tabs/common_widgets_in_tabs.dart';
import 'package:fast_food_app/ui/home/tabs/smoothie/smoothie_tab/smoothie_tab_widgets.dart';
import 'package:flutter/material.dart';

class SmoothieTab extends StatefulWidget {
  const SmoothieTab({super.key});

  @override
  State<SmoothieTab> createState() => _SmoothieTabState();
}

class _SmoothieTabState extends State<SmoothieTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        Flexible(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const BuildACustom(title: "Smoothie"),
                      const Text("Or"),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.filter_list_outlined)),
                    ],
                  ),
                ),
                GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: smoothies.length,
                  padding: const EdgeInsets.all(12),
                  shrinkWrap: true,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                  ),
                  itemBuilder: (context, index) {
                    return SmoothieCard(
                      smoothie: smoothies[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
