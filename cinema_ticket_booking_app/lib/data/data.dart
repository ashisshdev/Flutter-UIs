import 'package:cinema_ticket_booking_app/model/cast.dart';
import 'package:cinema_ticket_booking_app/model/movie.dart';

final List<Cast> myCast = [
  Cast(name: "Keanu Reeves", role: "John Wick", image: 'assets/cast/cast1.PNG'),
  Cast(name: "Ian McShane", role: "Winston", image: 'assets/cast/cast6.PNG'),
  Cast(name: "Clancy Brown", role: "Harbinger", image: 'assets/cast/cast5.PNG'),
  Cast(name: "Lance Reddick", role: "Charon", image: 'assets/cast/cast4.PNG'),

  Cast(name: "Laurence Fishburne", role: "Bowery King", image: 'assets/cast/cast2.PNG'),
  Cast(name: "George Georgiou", role: "The Elder", image: 'assets/cast/cast3.PNG'),
];

final List<Movie> thisFridayMovies = [
  Movie(
      name: "Shazam! Fury of the Gods",
      rating: 6.6,
      director: "David F. Sandberg",
      image: 'assets/movies/shazam.jpg',
      genre: ['Action', 'Adventure', "Comedy"],
      castList: myCast,
      description:
          "Bestowed with the powers of the gods, Billy Batson and his fellow foster kids are still learning how to juggle teenage life with their adult superhero alter egos. When a vengeful trio of ancient gods arrives on Earth in search of the magic stolen from them long ago, Shazam and his allies get thrust into a battle for their superpowers, their lives, and the fate of the world."),
  Movie(
      name: "Ant-Man and the Wasp: Quantumania",
      rating: 7,
      director: "Peyton Reed",
      image: 'assets/movies/ant.jpg',
      genre: ['Action', 'Adventure', "Comedy"],
      castList: myCast,
      description:
          "Ant-Man and the Wasp find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that pushes them beyond the limits of what they thought was possible."),
  Movie(
      name: "JohnWick: Chapter 4",
      rating: 8.4,
      director: "Chad Stahelski",
      image: 'assets/movies/johnwick.jpg',
      genre: ['Action', 'Crime', "Thriller"],
      castList: myCast,
      description:
          "With the price on his head ever increasing, legendary hit man John Wick takes his fight against the High Table global as he seeks out the most powerful players in the underworld, from New York to Paris to Japan to Berlin."),
  Movie(
      name: "Everything Everywhere All at Once",
      rating: 9,
      director: "Daniel Kwan",
      image: 'assets/movies/eeao.jpg',
      genre: ['Action', 'Sci-fi', "Adventure"],
      castList: myCast,
      description:
          "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance."),
  Movie(
      name: "Bheed",
      rating: 8.2,
      director: "Anubhav Sinha",
      image: 'assets/movies/bheed.jpg',
      genre: ['Drama', 'Social'],
      castList: myCast,
      description:
          "Chaos, violence and fear erupts when East Indian workers hit a checkpoint during a COVID-19 lockdown that restricts travel. Bheed is a fictitious account of the largest migration in India after the partition in 1947 which happened during the lockdown of 2020. It tells the story of how several characters in the film deal with the lockdown and migrate to a place they feel safe at."),
  Movie(
      name: "Creed III",
      rating: 8.3,
      director: "Michael B. Jordan",
      image: 'assets/movies/creed3.jpg',
      genre: ['Drama', 'Sports'],
      castList: myCast,
      description:
          "Still dominating the boxing world, Adonis Creed is thriving in his career and family life. When Damian, a childhood friend and former boxing prodigy resurfaces after serving time in prison, he's eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damian -- a fighter who has nothing to lose."),
];
