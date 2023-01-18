import 'package:flutter/material.dart';
import '../service/webservice.dart';
import 'movie_view_model.dart';
// Extending Change Notifier Provider
class MovieListViewModel extends ChangeNotifier {
  // List of type MovieViewModel
  List<MovieViewModel> movies = <MovieViewModel>[];
  // Asynchronous function
  // keyword is coming from searchbar (TextField)
  Future<void> fetchMovies(String keyword) async {
    // Calling Webservice for API Call
    // Results contain a list
    final results =  await Webservice().fetchMovies(keyword);
    // Assigning results according to MovieViewModel
    this.movies = results.map((item) => MovieViewModel(movie: item)).toList();
    // Notifying the listeners
    notifyListeners();
  }
}