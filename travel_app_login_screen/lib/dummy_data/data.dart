import 'package:travel_app_login_screen/models/activity.dart';
import 'package:travel_app_login_screen/models/destination.dart';
import 'package:travel_app_login_screen/models/hotel.dart';

final List<Hotel> myHotels = [
  Hotel(
    imageUrl: 'assets/images/home/hotel0.jpg',
    name: 'Lmao Homtel',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/home/hotel1.jpg',
    name: 'Homtel Lmao',
    address: '420 Average St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'assets/images/home/hotel2.jpg',
    name: 'Grand Haha',
    address: '69 Nice St',
    price: 240,
  ),
];

List<Activity> myActivities = [
  Activity(
    imageUrl: 'assets/images/home/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/home/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/home/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> myDestinations = [
  Destination(
    imageUrl: 'assets/images/home/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: myActivities,
  ),
  Destination(
    imageUrl: 'assets/images/home/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: myActivities,
  ),
  Destination(
    imageUrl: 'assets/images/home/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description:
        'Visit New Delhi for an amazing and unforgettable adventure. Visit New Delhi for an amazing and unforgettable adventure.',
    activities: myActivities,
  ),
  Destination(
    imageUrl: 'assets/images/home/saopaulo.jpg',
    city: 'Sao Paulo',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: myActivities,
  ),
  Destination(
    imageUrl: 'assets/images/home/newyork.jpg',
    city: 'New York City',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: myActivities,
  ),
];

List<Destination> topDestinations = [
  Destination(
      imageUrl: "assets/images/home/top_destinations/japan.jpg",
      city: "Kyoto",
      country: "Japan",
      description: "description",
      activities: []),
        Destination(
      imageUrl: "assets/images/home/top_destinations/italy.jpg",
      city: "Rome",
      country: "Italy",
      description: "description",
      activities: []),
        Destination(
      imageUrl: "assets/images/home/top_destinations/london.jpg",
      city: "London",
      country: "England",
      description: "description",
      activities: []),
        Destination(
      imageUrl: "assets/images/home/top_destinations/paris.jpg",
      city: "paris",
      country: "France",
      description: "description",
      activities: []),
        Destination(
      imageUrl: "assets/images/home/top_destinations/china.jpg",
      city: "Beijing",
      country: "China",
      description: "description",
      activities: []),
];
