import 'package:flutter/material.dart';

class Movie {
final String title;
final posterUrl;

Movie ({required this.title, this.posterUrl});
factory Movie.fromJson(Map<String, dynamic> json) {
  return Movie(
      title: json["Title"],
      posterUrl: json["Poster"]
  );
}
}