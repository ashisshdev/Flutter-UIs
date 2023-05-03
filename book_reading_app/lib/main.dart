import 'package:book_reading_app/ui/screens/sections/audio_books/audio_books_section.dart';
import 'package:book_reading_app/ui/screens/sections/home/home_section.dart';
import 'package:book_reading_app/ui/theme/colors.dart';
import 'package:ficonsax/ficonsax.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Reading App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.nunitoTextTheme(ThemeData.light().textTheme),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> bottomBarIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          decoration: const BoxDecoration(
              color: blackColor, borderRadius: BorderRadius.all(Radius.circular(30))),
          child: ValueListenableBuilder(
            valueListenable: bottomBarIndex,
            builder: (context, value, child) {
              return BottomNavigationBar(
                backgroundColor: Colors.transparent,
                type: BottomNavigationBarType.fixed,
                unselectedItemColor: Colors.grey,
                selectedItemColor: mainColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                iconSize: 30,
                currentIndex: value,
                onTap: (index) {
                  bottomBarIndex.value = index;
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(IconsaxOutline.home),
                      label: "Home",
                      activeIcon: Icon(IconsaxBold.home)),
                  BottomNavigationBarItem(
                      icon: Icon(IconsaxOutline.play),
                      label: "Listen",
                      activeIcon: Icon(IconsaxBold.play)),
                  BottomNavigationBarItem(
                      icon: Icon(IconsaxOutline.bookmark),
                      label: "Bookmarks",
                      activeIcon: Icon(IconsaxBold.bookmark)),
                  BottomNavigationBarItem(
                      icon: Icon(IconsaxOutline.user),
                      label: "Profile",
                      activeIcon: Icon(IconsaxBold.user)),
                ],
              );
            },
          ),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: bottomBarIndex,
        builder: (context, value, child) {
          return IndexedStack(
            index: value,
            children: const [HomeSection(), AudioBooksSection(), Placeholder(), Placeholder()],
          );
        },
      ),
    );
  }
}
