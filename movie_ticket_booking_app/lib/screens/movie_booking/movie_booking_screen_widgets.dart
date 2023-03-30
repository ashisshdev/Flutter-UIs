import 'package:flutter/material.dart';
import 'package:movie_ticket_booking_app/utils/helpers/date_time_extension.dart';
import 'package:movie_ticket_booking_app/utils/theme/app_color.dart';

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
        Container(
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
        const Positioned(
          bottom: 30,
          child: SeatInfoWidget(),
        )
      ],
    );
  }
}

class NewDateWidget extends StatelessWidget {
  const NewDateWidget({
    super.key,
    required this.date,
    this.isSelected = false,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      child: Text(
        "${date.monthName} ${date.day}",
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: isSelected ? AppColor.black : AppColor.primaryColor),
      ),
    );
  }
}

class NewTimeWidget extends StatelessWidget {
  const NewTimeWidget({
    super.key,
    required this.time,
    this.isSelected = false,
  });

  final TimeOfDay time;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Text(
      "${time.hour < 10 ? "0${time.hourOfPeriod}" : "${time.hour}"} : 00",
      style: Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: isSelected ? AppColor.black : AppColor.primaryColor),
    );
  }
}

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
                  ? AppColor.primaryColor
                  : Colors.grey[100]
              : Colors.grey,
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
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isAvailable ? AppColor.black : AppColor.black.withOpacity(0.6),
              ),
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
      children: [
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Booked",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: false,
        ),
        const SizedBox(width: 4),
        Text(
          "Available",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 16),
        const SeatWidget(
          seatNumber: "",
          width: 24,
          height: 24,
          isAvailable: true,
          isSelected: true,
        ),
        const SizedBox(width: 4),
        Text(
          "Selected",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
