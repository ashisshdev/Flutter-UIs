import 'package:flutter/material.dart';
import 'package:kayak_booking_app/data/dummy_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        actions: const [Icon(Icons.person)],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Text(
              "Rent a boat",
              textScaleFactor: 3.0,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width - 32,
              child: TextFormField(
                textAlignVertical: TextAlignVertical.bottom,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintStyle: const TextStyle(),
                  focusColor: Colors.black,
                  focusedBorder: _border(Colors.black, 3),
                  border: _border(Colors.black, 1),
                  enabledBorder: _border(Colors.black, 2),
                  hintText: 'Tulip',
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 10, right: 5, left: 5, bottom: 5),
                    child: Icon(Icons.search),
                  ),
                ),
                onFieldSubmitted: (value) {},
              ),
            ),
            PageView.builder(
              itemCount: kayaks.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width - 32,
                  color: Colors.green,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
      borderSide: BorderSide(width: width, color: color),
      borderRadius: BorderRadius.circular(12),
    );
