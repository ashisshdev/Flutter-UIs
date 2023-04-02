import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets.dart';

class MovieBookingScreen extends StatefulWidget {
  final String movieTitle;
  final String movieImage;
  const MovieBookingScreen(
      {super.key, required this.movieTitle, required this.movieImage});

  @override
  State<MovieBookingScreen> createState() => _MovieBookingScreenState();
}

const int numberOfRows = 8;
const int numberOfSeatsInRow = 10;

class _MovieBookingScreenState extends State<MovieBookingScreen> {
  final selectedSeat = ValueNotifier<List<String>>([]);
  final selectedDate = ValueNotifier<DateTime>(DateTime.now());
  final selectedTime = ValueNotifier<TimeOfDay?>(null);
  final selectedSlot = ValueNotifier<MovieSlot>(slots[0]);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text(
          widget.movieTitle,
          // style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          SlideAndFadeElementsCustom(
            yAxis: -100,
            child: Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              width: w,
              child: Row(
                children: [
                  SizedBox(
                    width: w / 4,
                    child: DropdownButton(
                        items: ['April  3', 'April  4', 'April  5', 'April  6']
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    "  $e",
                                    textScaleFactor: 1.4,
                                  ),
                                ))
                            .toList(),
                        value: 'April  3',
                        style: const TextStyle(color: Colors.white),
                        dropdownColor: Colors.black,
                        iconEnabledColor: Colors.white,
                        iconDisabledColor: Colors.white,
                        isExpanded: true,
                        onChanged: (newVal) {}),
                  ),
                  SizedBox(
                    width: w / 1.7,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: ['10:00', '1:00', '16:00', '18:30', "20:30"]
                              .map((e) => Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 6),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 7, horizontal: 15),
                                    decoration: BoxDecoration(
                                        color:
                                            e == '10:00' ? Colors.yellow : Colors.black,
                                        borderRadius:
                                            const BorderRadius.all(Radius.circular(5)),
                                        border: Border.all(
                                            color: e == '10:00'
                                                ? Colors.black
                                                : Colors.white,
                                            width: 1)),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                          color:
                                              e == '10:00' ? Colors.black : Colors.white,
                                          fontWeight: FontWeight.w800),
                                    ),
                                  ))
                              .toList()),
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.white30,
              thickness: 1,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: h * 0.25,
                  width: w - 20,
                  child: MovieTeatherScreen(
                    image: widget.movieImage,
                    //  maxWidth: w, maxHeigth: 200
                  )),
            ],
          ),
          const Spacer(),

          SlideAndFadeElementsCustom(
            child: ValueListenableBuilder<List<String>>(
              valueListenable: selectedSeat,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      // height: MediaQuery.of(context).size.height * 0.5,
                      width: w - 40,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          /// lets make 8 seat horizontal
                          /// and 6 seat vertical
                          for (int i = 1; i <= numberOfRows; i++) ...[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  String.fromCharCode(i + 64),
                                  textScaleFactor: 1.1,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.yellow),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                for (int j = 1; j <= numberOfSeatsInRow; j++) ...[
                                  SeatWidget(
                                    // seatNumber: "${String.fromCharCode(i + 64)}$j",
                                    seatNumber: "$j",
                                    isAvailable: !reservedSeats.contains(i * j),
                                    isSelected: value.contains(
                                      "${String.fromCharCode(i + 64)}$j",
                                    ),
                                    onTap: () {
                                      if (value.contains(
                                        "${String.fromCharCode(i + 64)}$j",
                                      )) {
                                        selectedSeat.value = List.from(value)
                                          ..remove(
                                            "${String.fromCharCode(i + 64)}$j",
                                          );
                                      } else {
                                        selectedSeat.value = List.from(value)
                                          ..add(
                                            "${String.fromCharCode(i + 64)}$j",
                                          );
                                      }
                                    },
                                  ),
                                  // make gap, and in the center wider gap
                                  SizedBox(
                                      width:
                                          j == (numberOfSeatsInRow / 2).round() ? 20 : 4)
                                ],
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                            SizedBox(height: i == 6 || i == 4 ? 20 : 5)
                          ],
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const Spacer(),
          // const SizedBox(height: 40),
          // Container(
          //   padding: const EdgeInsets.only(left: 10),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Available Time Slots : ",
          //         textScaleFactor: 1.2,
          //         style: Theme.of(context).textTheme.bodyLarge,
          //       ),
          //       const SizedBox(
          //         height: 10,
          //       ),
          //       ValueListenableBuilder<MovieSlot>(
          //         valueListenable: selectedSlot,
          //         builder: (context, value, _) {
          //           return SizedBox(
          //             height: 50,
          //             width: MediaQuery.of(context).size.width,
          //             child: ListView(
          //               scrollDirection: Axis.horizontal,
          //               children: List.generate(
          //                 slots.length,
          //                 (index) {
          //                   final choosenSlot = slots[index];
          //                   bool isSelected = slots[index] == value;
          //                   return InkWell(
          //                       onTap: () {
          //                         selectedSlot.value = choosenSlot;
          //                       },
          //                       child: Container(
          //                         width: 100,
          //                         margin: const EdgeInsets.symmetric(horizontal: 5),
          //                         decoration: BoxDecoration(
          //                           borderRadius:
          //                               const BorderRadius.all(Radius.circular(10)),
          //                           border: Border.all(color: Colors.yellow, width: 2),
          //                           color: isSelected ? Colors.yellow : Colors.white,
          //                         ),
          //                         // child: Column(
          //                         //   mainAxisAlignment: MainAxisAlignment.center,
          //                         //   children: [
          //                         //     NewDateWidget(
          //                         //       date: slots[index].date,
          //                         //       isSelected: isSelected,
          //                         //     ),
          //                         //     NewTimeWidget(
          //                         //       time: slots[index].time,
          //                         //       isSelected: isSelected,
          //                         //     ),
          //                         //   ],
          //                         // ),
          //                       ));
          //                 },
          //               ),
          //             ),
          //           );
          //         },
          //       ),
          //       const SizedBox(height: 40),
          //     ],
          //   ),
          // ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Divider(
              color: Colors.white30,
              thickness: 1,
            ),
          ),
          SlideAndFadeElementsCustom(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Total Price",
                          textScaleFactor: 1.2,
                          style:
                              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          // style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: 2),
                        ValueListenableBuilder<List<String>>(
                          valueListenable: selectedSeat,
                          builder: (context, value, _) {
                            return Text(
                              "\$${value.length * 10}",
                              textScaleFactor: 1.8,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                              // style: Theme.of(context).textTheme.headlineSmall,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      padding: const EdgeInsets.all(13),
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                        "Book Now",
                        textScaleFactor: 1.4,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        // style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List reservedSeats = [5, 19, 12, 14, 13, 22, 23, 3, 9];

class MovieSlot {
  DateTime date;
  TimeOfDay time;
  MovieSlot({
    required this.date,
    required this.time,
  });
}

List<MovieSlot> slots = [
  MovieSlot(
      date: DateTime.now(),
      time: TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 1)))),
  MovieSlot(
      date: DateTime.now(),
      time: TimeOfDay.fromDateTime(DateTime.now().add(const Duration(hours: 4)))),
  MovieSlot(
      date: DateTime.now().add(const Duration(days: 1)),
      time:
          TimeOfDay.fromDateTime(DateTime.now().add(const Duration(days: 1, hours: -2)))),
  MovieSlot(
      date: DateTime.now().add(const Duration(days: 1)),
      time:
          TimeOfDay.fromDateTime(DateTime.now().add(const Duration(days: 1, hours: 1)))),
  MovieSlot(
      date: DateTime.now().add(const Duration(days: 1)),
      time:
          TimeOfDay.fromDateTime(DateTime.now().add(const Duration(days: 1, hours: 4)))),
];
