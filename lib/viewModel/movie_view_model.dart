import '../Model/movie.dart';

class MovieViewModel {
  // Movie is defined in models movie.dart
  final Movie movie;
  MovieViewModel({required this.movie});
  // the title coming is going to title of movie in  models
  String get title {
    return this.movie.title;
  }
  // the poster coming is going to posterUrl of movie in  models
  String get poster {
    return this.movie.posterUrl;
  }
}