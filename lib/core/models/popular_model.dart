import 'package:movies_project/core/models/allmovies_model.dart';

class PopularModel extends AllMoviesModel {
  PopularModel(
      {int? id,
      String? title,
      String? posterPath,
      String? releaseDate,
      String? backPath,
      double? rate})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            releaseDate: releaseDate,
            backPath: backPath,
            rate: rate);

  @override
  PopularModel fromJson(Map<String, dynamic> json) => PopularModel(
      id: json["id"],
      backPath: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
      releaseDate: json["release_date"],
      rate: json["vote_average"]);
}
