import 'package:flutter/material.dart';
import 'package:whatsapp/chats.dart';

class WhatsAppTab extends StatelessWidget {
  const WhatsAppTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double yourWidth = width / 10;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context,
              bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                  pinned: true,
                  floating: true,
                  snap: true,
                  backgroundColor:
                      const Color(0XFF075E54),
                  title: const Text("WhatsApp"),
                  actions: const [
                    Icon(Icons.search),
                    Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 3)),
                    Icon(Icons.more_vert)
                  ],
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    isScrollable: true,
                    indicatorSize:
                        TabBarIndicatorSize.tab,
                    labelPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 0,
                            vertical: 5),
                    tabs: [
                      SizedBox(
                        width: yourWidth,
                        child: const Icon(
                            Icons.camera_alt),
                      ),
                      Container(
                        width: yourWidth * 3,
                        alignment: Alignment.center,
                        child: Text(
                          "CHATS",
                          style: customStyle,
                        ),
                      ),
                      Container(
                        width: yourWidth * 3,
                        alignment: Alignment.center,
                        child: Text(
                          "STATUS",
                          style: customStyle,
                        ),
                      ),
                      Container(
                        width: yourWidth * 3,
                        alignment: Alignment.center,
                        child: Text(
                          "CALLS",
                          style: customStyle,
                        ),
                      )
                    ],
                  ))
            ];
          },
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Text("Camera"),
              ChatsList(),
              Text("Status"),
              Text("Calls")
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle customStyle = const TextStyle(
    fontSize: 19, fontWeight: FontWeight.w700);
