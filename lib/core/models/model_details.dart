import 'package:movies_project/core/models/allmovies_model.dart';

class ModelDetails extends AllMoviesModel {
  String? description;
  List<KindOfMovie>? kinds;

  ModelDetails({
    int? id,
    String? posterPath,
    String? releaseDate,
    String? title,
    String? backPath,
    double? rate,
    this.description,
    this.kinds,
  }) : super(
            id: id,
            posterPath: posterPath,
            title: title,
            releaseDate: releaseDate,
            backPath: backPath,
            rate: rate);

  @override
  ModelDetails fromJson(Map<String, dynamic> json) {
    if (json["genres"] != null) {
      kinds = [];
      json["genres"].forEach((e) {
        kinds?.add(KindOfMovie.fromJson(e));
      });
    }
    return ModelDetails(
        id: json["id"],
        backPath: json["backdrop_path"],
        posterPath: json["poster_path"],
        title: json["title"],
        releaseDate: json["release_date"],
        description: json["overview"],
        rate: json["vote_average"],
        kinds: kinds);
  }
}

class KindOfMovie {
  final String name;

  KindOfMovie({required this.name});

  factory KindOfMovie.fromJson(Map<String, dynamic> json) =>
      KindOfMovie(name: json["name"]);
}
