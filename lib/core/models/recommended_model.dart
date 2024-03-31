import 'package:movies_project/core/models/allmovies_model.dart';

class RecommendedModel extends AllMoviesModel {
  RecommendedModel({
    int? id,
    String? title,
    String? posterPath,
    String? backPath,
    String? releaseDate,
    double? rate,
  }) : super(
            id: id,
            title: title,
            posterPath: posterPath,
            backPath: backPath,
            releaseDate: releaseDate,
            rate: rate);

  @override
  RecommendedModel fromJson(Map<String, dynamic> json) => RecommendedModel(
      id: json["id"],
      title: json["title"],
      rate: json["vote_average"],
      posterPath: json["poster_path"],
      backPath: json["backdrop_path"],
      releaseDate: json["release_date"]);
}
