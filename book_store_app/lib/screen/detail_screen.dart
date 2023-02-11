// ignore_for_file: library_private_types_in_public_api

import 'package:book_store_app/model/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

/// Detail screen.
class DetailScreen extends StatefulWidget {
  final Book book;

  const DetailScreen({
    Key? key,
    required this.book,
  }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final Color _accentColor = const Color(0xFF272727);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Iconsax.arrow_left, color: Colors.grey[600]),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20.0),
              child: Icon(Iconsax.save_add, color: Colors.grey[600]),
            ),
          ],
        ),
        body: SafeArea(
            child: Stack(
          fit: StackFit.loose,
          children: [
            Align(
              alignment: const Alignment(-0.8, 0),
              child: Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(20.0)),
                    color: Colors.green.withOpacity(0.5)),
              ),
            ),
            Align(
              alignment: const Alignment(-0.5, -0.9),
              child: Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(100.0)),
                    color: Colors.red.withOpacity(0.5)),
              ),
            ),
            Align(
              alignment: const Alignment(0.8, -0.3),
              child: Container(
                width: 180.0,
                height: 180.0,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(150.0)),
                    color: Colors.blue.withOpacity(0.4)),
              ),
            ),
            Align(
              alignment: const Alignment(0, -0.8),
              child: Hero(
                tag: widget.book.image,
                child: Container(
                  width: 250.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.book.image))),
                ),
              ),
            ),
            Align(
                alignment: const Alignment(0, 0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(widget.book.title,
                        style: const TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.w800,
                            color: Colors.black)),
                    const SizedBox(height: 10.0),
                    Text(widget.book.author,
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey)),
                    const SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 4.5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          ignoreGestures: true,
                          itemPadding: const EdgeInsets.symmetric(
                              horizontal: 0.5),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(width: 10.0),
                        const Text('4.5',
                            style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey))
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0),
                      child: Text(
                          'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                              height: 1.5)),
                    )
                  ],
                )),
            Align(
              alignment: const Alignment(0, 0.9),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                width: double.infinity,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(15.0)),
                  color: _accentColor,
                ),
                child: Center(
                  child: Text(
                      "ADD TO CART  -  \$${widget.book.price}",
                      style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white)),
                ),
              ),
            )
          ],
        )));
  }
}
