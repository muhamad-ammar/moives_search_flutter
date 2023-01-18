import 'dart:convert';
import '../Model/movie.dart';
import 'package:http/http.dart' as http;
class Webservice {
  // fetch movies function
  Future<List<Movie>> fetchMovies(String keyword) async {
    // Url for getting the data
    final  url = Uri.parse("http://www.omdbapi.com/?s=$keyword&apikey=eb0d5538");
    // Getting response
    final response = await http.get(url);
    // Checking if request is succeeded
    if(response.statusCode == 200) {
      // decoding the response body to json format
      final body = jsonDecode(response.body);
      // Extracting value of Search key
      final Iterable json = body["Search"];
      // Mapping the json to movie model and returning
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}