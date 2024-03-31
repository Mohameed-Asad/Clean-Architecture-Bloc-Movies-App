import 'package:movies_project/core/models/allmovies_model.dart';

class ReleaseModel extends AllMoviesModel {
  ReleaseModel(
      {int? id,
      String? title,
      String? posterPath,
      String? backPath,
      String? releaseDate,
      double? rate})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            backPath: backPath,
            releaseDate: releaseDate,
            rate: rate);

  @override
  ReleaseModel fromJson(Map<String, dynamic> json) => ReleaseModel(
        id: json["id"],
        title: json["title"],
        posterPath: json["poster_path"],
        backPath: json["backdrop_path"],
        releaseDate: json["release_date"],
        rate: json["vote_average"],
      );
}
