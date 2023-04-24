import 'package:donation_app/data/dummy_data.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class Local extends StatefulWidget {
  const Local({super.key});

  @override
  State<Local> createState() => _LocalState();
}

class _LocalState extends State<Local> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      decoration:
          const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const SectionTitle(title: "They need your help."),
              const SizedBox(height: 15),
              SizedBox(
                width: w,
                height: 160,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final item in theyNeedYourHelp) ...[
                        AspectRatio(
                          aspectRatio: 120 / 130,
                          child: ImageCard(item: item),
                        ),
                      ],
                      AspectRatio(
                        aspectRatio: 120 / 130,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: const BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color(0xFF2F44CC), width: 2)),
                                  child: const Icon(Icons.arrow_forward,
                                      size: 30, color: Color(0xFF2F44CC))),
                              const Text("View All"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const SectionTitle(title: "Helping areas"),
              const SizedBox(height: 15),
              const Categories(),
              const SizedBox(height: 30),
              const StartNewCause2(),
              Container(
                color: Colors.grey,
                height: 600,
                margin: const EdgeInsets.all(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// local categories 
/// Education 
/// HealthCare 
/// Women Empowerment 
/// Men's Rights 
/// 
class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// Warzone Nations
// refugees 