import 'package:book_reading_app/data/data.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:flutter/material.dart';

import 'home_section_widgets.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({super.key});

  @override
  State<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends State<HomeSection> {
  ValueNotifier<String> selectedCategory = ValueNotifier(categories[0]);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        extendBody: true,
        appBar: const MyHomeAppBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                height: h * 0.145,
                child: const WeeklyGoalWidget(),
              ),
              Container(
                padding: const EdgeInsets.only(top: 15),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: const SectionTile(
                  title: "For you",
                  showArrow: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: w,
                height: h * 0.06,
                margin: const EdgeInsets.only(bottom: 10),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ValueListenableBuilder(
                      valueListenable: selectedCategory,
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            selectedCategory.value = categories[index];
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(30)),
                              color: categories[index] == value ? blackColor : Colors.grey.shade200,
                            ),
                            margin: const EdgeInsets.all(5),
                            child: Center(
                                child: Text(
                              categories[index],
                              style: TextStyle(
                                  fontWeight: categories[index] == value ? FontWeight.w600 : FontWeight.w400,
                                  color: categories[index] == value ? Colors.white : blackColor),
                            )),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10),
                width: MediaQuery.of(context).size.width,
                height: h * 0.25,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: allBooks.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      width: w * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          color: Colors.grey,
                          image: DecorationImage(image: AssetImage(allBooks[index].image), fit: BoxFit.cover)),
                      margin: const EdgeInsets.all(5),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: const SectionTile(
                  title: "Continue Reading",
                  showArrow: false,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: h * .20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  // color: Colors.green,
                ),
                clipBehavior: Clip.hardEdge,
                child: const ContinueReadinCard(),
              ),
              Container(height: h * .18),
            ],
          ),
        ));
  }
}
