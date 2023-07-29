import 'dart:convert';

MovieResponse movieResponseFromJson(dynamic str) =>  MovieResponse.fromJson(jsonDecode(str));

class MovieResponse {
  MovieResponse({
    required this.genres,
    required this.movies,
  });
  late final List<String> genres;
  late final List<Movies> movies;

  MovieResponse.fromJson(Map<String, dynamic> json){
    genres = List.castFrom<dynamic, String>(json['genres']);
    movies = List.from(json['movies']).map((e)=>Movies.fromJson(e)).toList();
  }
}

class Movies {
  Movies({
    required this.id,
    required this.title,
    required this.year,
    required this.runtime,
    required this.genres,
    required this.director,
    required this.actors,
    required this.plot,
    required this.posterUrl,
  });
  late final int id;
  late final String title;
  late final String year;
  late final String runtime;
  late final List<String> genres;
  late final String director;
  late final String actors;
  late final String plot;
  late final String posterUrl;

  Movies.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    year = json['year'];
    runtime = json['runtime'];
    genres = List.castFrom<dynamic, String>(json['genres']);
    director = json['director'];
    actors = json['actors'];
    plot = json['plot'];
    posterUrl = json['posterUrl'];
  }
}