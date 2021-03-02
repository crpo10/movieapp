// class Movies {
//   List<Movie> items = new List();

//   Movies();

//   Movies.fromJsonList(List<dynamic> jsonList) {
//     if (jsonList == null) return;

//     for (var item in jsonList) {
//       final movie = new Movie.fromJsonMap(item);
//       items.add(movie);
//     }
//   }
// }

// class Movie {
//   String originalTitle;
//   String title;
//   bool video;
//   double voteAverage;
//   double popularity;
//   String overview;
//   String releaseDate;
//   int id;
//   bool adult;
//   String backdropPath;
//   int voteCount;
//   List<int> genreIds;
//   String posterPath;
//   String originalLanguage;

//   Movie({
//     this.originalTitle,
//     this.title,
//     this.video,
//     this.voteAverage,
//     this.popularity,
//     this.overview,
//     this.releaseDate,
//     this.id,
//     this.adult,
//     this.backdropPath,
//     this.voteCount,
//     this.originalLanguage,
//     this.genreIds,
//     this.posterPath,
//   });

//   Movie.fromJsonMap(Map<String, dynamic> json) {
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'] / 1;
//     popularity = json['popularity'] / 1;
//     overview = json['overview'];
//     releaseDate = json['release_date'];
//     id = json['id'];
//     adult = json['adult '];
//     backdropPath = json['backdrop_path'];
//     voteCount = json['vote_count'];
//     genreIds = json['genre_ids'].cast<int>();
//     posterPath = json['poster_path'];
//   }
// }

class Movies {
  List<Movie> items = new List();

  Movies();

  Movies.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final movie = new Movie.fromJsonMap(item);
      items.add(movie);
    }
  }
}

class Movie {
  String uniqueId;

  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Movie({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Movie.fromJsonMap(Map<String, dynamic> json) {
    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }
  getPosterImg() {
    if (posterPath == null) {
      return 'https://secardiologia.es/media/coalaweb/components/generic/images/cw-noimage.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {
    if (backdropPath == null) {
      return 'https://secardiologia.es/media/coalaweb/components/generic/images/cw-noimage.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}
