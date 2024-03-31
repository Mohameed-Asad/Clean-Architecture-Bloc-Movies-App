import 'package:movies_project/core/models/allmovies_model.dart';

class SimilarModel extends AllMoviesModel {
  SimilarModel(
      {int? id,
      String? title,
      String? posterPath,
      String? releaseDate,
      double? rate,
      String? backPath})
      : super(
            id: id,
            title: title,
            posterPath: posterPath,
            releaseDate: releaseDate,
            rate: rate,
            backPath: backPath);

  @override
  SimilarModel fromJson(Map<String, dynamic> json) => SimilarModel(
        id: json["id"],
        title: json["title"],
        rate: json["vote_average"],
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        backPath: json["backdrop_path"],
      );
}
