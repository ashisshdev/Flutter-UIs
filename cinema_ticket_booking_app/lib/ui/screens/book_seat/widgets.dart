import 'dart:math';

import 'package:flutter/material.dart';

class MovieTeatherScreen extends StatelessWidget {
  const MovieTeatherScreen({
    Key? key,
    required this.image,
    // required this.maxWidth,
    // required this.maxHeigth,
  }) : super(key: key);

  final String image;
  // final double maxWidth;
  // final double maxHeigth;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SlideAndFadeElementsCustom(
          yAxis: -200,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 2),
            duration: const Duration(milliseconds: 1200),
            builder: (BuildContext context, double value, Widget? child) {
              return Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.000)
                  ..rotateX(value * pi),
                alignment: Alignment.center,
                child: Transform.scale(
                  scale: -value * -0.5,
                  child: child,
                ),
              );
            },
            child: Container(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(.9),
              transformAlignment: Alignment.topCenter,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor, // .withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  alignment: const Alignment(0, -0.7),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 30,
          child: SlideAndFadeElementsCustom(child: SeatInfoWidget()),
        )
      ],
    );
  }
}

// class NewDateWidget extends StatelessWidget {
//   const NewDateWidget({
//     super.key,
//     required this.date,
//     this.isSelected = false,
//   });

//   final DateTime date;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 400),
//       child: Text(
//         "${date.monthName} ${date.day}",
//         style: Theme.of(context)
//             .textTheme
//             .bodyLarge
//             ?.copyWith(color: isSelected ? Colors.black : Colors.yellow),
//       ),
//     );
//   }
// }

// class NewTimeWidget extends StatelessWidget {
//   const NewTimeWidget({
//     super.key,
//     required this.time,
//     this.isSelected = false,
//   });

//   final TimeOfDay time;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       "${time.hour < 10 ? "0${time.hourOfPeriod}" : "${time.hour}"} : 00",
//       style: Theme.of(context)
//           .textTheme
//           .bodyLarge
//           ?.copyWith(color: isSelected ? Colors.black : Colors.yellow),
//     );
//   }
// }

class SeatWidget extends StatelessWidget {
  const SeatWidget({
    super.key,
    required this.seatNumber,
    this.onTap,
    this.height = 22,
    this.width = 22,
    this.isSelected = false,
    this.isAvailable = true,
  });

  final void Function()? onTap;
  final String seatNumber;
  final double width;
  final double height;
  final bool isSelected;
  final bool isAvailable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isAvailable
              ? isSelected
                  ? Colors.yellow
                  : Colors.grey[100]
              : Colors.white10,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: isAvailable
                ? isSelected
                    ? Colors.black12
                    : Colors.grey.shade400
                : Colors.grey,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          isSelected ? seatNumber : " ",
          style: TextStyle(
              color: isAvailable ? Colors.black : Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}

class SeatInfoWidget extends StatelessWidget {
  const SeatInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        SizedBox(width: 4),
        Text(
          "Booked",
          style: TextStyle(color: Colors.white),
          // style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 16),
        SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        SizedBox(width: 4),
        Text(
          "Available",
          style: TextStyle(color: Colors.white),

          // style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(width: 16),
        SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        SizedBox(width: 4),
        Text(
          "Selected",
          style: TextStyle(color: Colors.white),

          // style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

extension DateTimeExtension on DateTime {
  String get monthName {
    switch (month) {
      case DateTime.january:
        return "Jan";
      case DateTime.february:
        return "Feb";
      case DateTime.march:
        return "Mar";
      case DateTime.april:
        return "Apr";
      case DateTime.may:
        return "May";
      case DateTime.june:
        return "Jun";
      case DateTime.july:
        return "Jul";
      case DateTime.august:
        return "Aug";
      case DateTime.september:
        return "Sep";
      case DateTime.october:
        return "Oct";
      case DateTime.november:
        return "Nov";
      case DateTime.december:
        return "Dec";
      default:
        return "";
    }
  }

  String get simpleDate {
    return "$day/$month/$year";
  }
}

class SlideAndFadeElementsCustom extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final double yAxis;
  const SlideAndFadeElementsCustom(
      {super.key,
      required this.child,
      this.yAxis = 200,
      this.duration = const Duration(milliseconds: 1000)});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: duration,
      tween: Tween<double>(begin: 0.0, end: 1),
      child: child,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: TweenAnimationBuilder(
            duration: duration,
            tween: Tween<Offset>(begin: Offset(0, yAxis), end: const Offset(0, 0)),
            builder: (context, value, child) {
              return Transform.translate(offset: value, child: child);
            },
            child: child,
          ),
        );
      },
    );
  }
}
