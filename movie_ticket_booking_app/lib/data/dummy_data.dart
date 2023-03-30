import 'package:movie_ticket_booking_app/models/movie.dart';

final nowPlayingMovie = [
  Movie(
    title: "Minions: The Rise of Gru",
    assetImage: "assets/movie_posters/minion.jpeg",
    type: "Action",
    duration: "1h 27m",
    rating: "7.7/10",
    synopsis:
        "A fanboy of a supervillain supergroup known as the Vicious 6, Gru hatches a plan to become evil enough to join them, with the backup of his followers, the Minions.",
    isPlaying: true,
  ),
  Movie(
    title: "Thor: Love and Thunder",
    assetImage: "assets/movie_posters/thor.jpeg",
    type: "Action",
    duration: "1h 59m",
    rating: "7.0/10",
    synopsis:
        "After his retirement is interrupted by Gorr the God Butcher, a galactic killer who seeks the extinction of the gods, Thor enlists the help of King Valkyrie, Korg, and ex-girlfriend Jane Foster, who now inexplicably wields Mjolnir as the Mighty Thor. Together they embark upon a harrowing cosmic adventure to uncover the mystery of the God Butcher's vengeance and stop him before it's too late.",
    isPlaying: true,
  ),
  Movie(
    title: "Jurassic World Dominion",
    assetImage: "assets/movie_posters/jurassic.jpeg",
    type: "Action",
    duration: "2h 29m",
    rating: "8.0/10",
    synopsis:
        "Four years after Isla Nublar was destroyed, dinosaurs now live—and hunt—alongside humans all over the world. This fragile balance will reshape the future and determine, once and for all, whether human beings are to remain the apex predators on a planet they now share with history's most fearsome creatures.",
    isPlaying: true,
  ),
];

final List<MovieModel> thisFridayMovies = [
  MovieModel(
      name: "Shazam! Fury of the Gods",
      rating: 6.6,
      director: "David F. Sandberg",
      image: 'assets/movies/shazam.jpg',
      genre: ['Action', 'Adventure', "Comedy"],
      castList: myCast,
      description:
          "Bestowed with the powers of the gods, Billy Batson and his fellow foster kids are still learning how to juggle teenage life with their adult superhero alter egos. When a vengeful trio of ancient gods arrives on Earth in search of the magic stolen from them long ago, Shazam and his allies get thrust into a battle for their superpowers, their lives, and the fate of the world."),
  MovieModel(
      name: "Ant-Man and the Wasp: Quantumania",
      rating: 7,
      director: "Peyton Reed",
      image: 'assets/movies/ant.jpg',
      genre: ['Action', 'Adventure', "Comedy"],
      castList: myCast,
      description:
          "Ant-Man and the Wasp find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that pushes them beyond the limits of what they thought was possible."),
  MovieModel(
      name: "JohnWick: Chapter 4",
      rating: 8.4,
      director: "Chad Stahelski",
      image: 'assets/movies/johnwick.jpg',
      genre: ['Action', 'Crime', "Thriller"],
      castList: myCast,
      description:
          "With the price on his head ever increasing, legendary hit man John Wick takes his fight against the High Table global as he seeks out the most powerful players in the underworld, from New York to Paris to Japan to Berlin."),
  MovieModel(
      name: "Everything Everywhere All at Once",
      rating: 9,
      director: "Daniel Kwan",
      image: 'assets/movies/eeao.jpg',
      genre: ['Action', 'Sci-fi', "Adventure"],
      castList: myCast,
      description:
          "When an interdimensional rupture unravels reality, an unlikely hero must channel her newfound powers to fight bizarre and bewildering dangers from the multiverse as the fate of the world hangs in the balance."),
  MovieModel(
      name: "Bheed",
      rating: 8.2,
      director: "Anubhav Sinha",
      image: 'assets/movies/bheed.jpg',
      genre: ['Drama', 'Social'],
      castList: myCast,
      description:
          "Chaos, violence and fear erupts when East Indian workers hit a checkpoint during a COVID-19 lockdown that restricts travel. Bheed is a fictitious account of the largest migration in India after the partition in 1947 which happened during the lockdown of 2020. It tells the story of how several characters in the film deal with the lockdown and migrate to a place they feel safe at."),
  MovieModel(
      name: "Creed III",
      rating: 8.3,
      director: "Michael B. Jordan",
      image: 'assets/movies/creed3.jpg',
      genre: ['Drama', 'Sports'],
      castList: myCast,
      description:
          "Still dominating the boxing world, Adonis Creed is thriving in his career and family life. When Damian, a childhood friend and former boxing prodigy resurfaces after serving time in prison, he's eager to prove that he deserves his shot in the ring. The face-off between former friends is more than just a fight. To settle the score, Adonis must put his future on the line to battle Damian -- a fighter who has nothing to lose."),
];

final List<Cast> myCast = [
  Cast(name: "Keanu Reeves", role: "John Wick", image: 'assets/cast/cast1.PNG'),
  Cast(name: "Laurence Fishburne", role: "Bowery King", image: 'assets/cast/cast12.PNG'),
  Cast(name: "George Georgiou", role: "The Elder", image: 'assets/cast/cast3.PNG'),
  Cast(name: "Lance Reddick", role: "Charon", image: 'assets/cast/cast4.PNG'),
  Cast(name: "Clancy Brown", role: "Harbinger", image: 'assets/cast/cast5.PNG'),
  Cast(name: "Ian McShane", role: "Winston", image: 'assets/cast/cast6.PNG'),
];

final upcoming = [
  Movie(
    title: "DC League of Super-Pets",
    assetImage: "assets/movie_posters/super-pets.jpeg",
    type: "Animation",
    duration: "1h 46m",
    rating: "N/A",
    synopsis:
        "When Superman and the rest of the Justice League are kidnapped, Krypto the Super-Dog must convince a rag-tag shelter pack - Ace the hound, PB the potbellied pig, Merton the turtle and Chip the squirrel - to master their own newfound powers and help him rescue the superheroes.",
    isPlaying: false,
  ),
  Movie(
    title: "Nope",
    assetImage: "assets/movie_posters/nope.jpeg",
    type: "Science Fiction",
    duration: "2h 11m",
    rating: "N/A",
    synopsis:
        "Residents in a lonely gulch of inland California bear witness to an uncanny, chilling discovery.",
    isPlaying: false,
  ),
  Movie(
    title: "Thirteen Lives",
    assetImage: "assets/movie_posters/lives.jpeg",
    type: "Drama",
    duration: "1h 46m",
    rating: "N/A",
    synopsis:
        "A dramatization of the rescue of a boys soccer team from an underground cave in Thailand.",
    isPlaying: false,
  ),
];

List<String> banners = [
  "assets/banners/banner_1.jpeg",
  "assets/banners/banner_2.jpeg",
  "assets/banners/banner_3.jpeg",
  "assets/banners/banner_4.jpeg",
];

List<String> categories = [
  "Horror",
  "Action",
  "Comedy",
  "Romance",
];
