import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({Key? key}) : super(key: key);

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_outlined,
            color: Colors.black, size: 18.0),
        title: const Text('SNK',
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontFamily: 'Montserrat-black')),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0, top: 17.0),
            child: FaIcon(FontAwesomeIcons.heart,
                color: Colors.black, size: 18.0),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 300,
                  width: size.width,
                  child: Image.asset(
                    "assets/images/item.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Text('NIKE Men\'s Shoes',
                      style: TextStyle(
                          fontSize: 13.0, color: Colors.grey)),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Nike Air Huarache',
                          style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.black)),
                      Text('\$120',
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.black,
                              fontFamily: 'Montserrat-black')),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      const SizedBox(width: 10.0),
                      Container(
                        alignment: Alignment.center,
                        child: const Text('Sizes  : ',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black)),
                      ),
                      const SizedBox(width: 10.0),
                      _makeSizeButton('US6.5', true),
                      const SizedBox(width: 10.0),
                      _makeSizeButton('US7', true),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US7.5', false),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US8', true),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US8.5', true),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US9', true),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US9.5', false),
                      const SizedBox(width: 8.0),
                      _makeSizeButton('US10', true),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Text(
                      '*Faster Shipping options may be available',
                      style: TextStyle(
                          fontSize: 13.0, color: Colors.grey)),
                ),
                const SizedBox(height: 30.0),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Text('Description',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black)),
                ),
                const SizedBox(height: 15.0),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: const Text(
                      'Built to fit your foot and designed for comfort, the Nike Air Huarache brings back a street-level favorite. Soft leather accents on the upper mix with super-breathable, perfectly shined neoprene-like fabric for easy styling. The low-cut collar and bootie-like construction keep it sleek. Its iconic heel clip and stripped away branding keep the early \'90s look you love.',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueGrey,
                          height: 1.5)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _makeSizeButton(String size, bool available) {
    return Container(
      width: 80.0,
      height: 25.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
        border: available
            ? Border.all(color: Colors.grey, width: 0.9)
            : Border.all(color: Colors.transparent, width: 0),
        color: available ? Colors.white : Colors.grey[300],
      ),
      child: Center(
        child: Text(size,
            style: available
                ? const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.black)
                : TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[50])),
      ),
    );
  }
}
