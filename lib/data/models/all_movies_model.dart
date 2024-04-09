import 'package:movies_project/domain/entities/all_movies_model.dart';

class AllMoviesDataModel extends AllMoviesModel {
  AllMoviesDataModel(
      {required super.id,
      required super.firebaseId,
      required super.title,
      required super.posterPath,
      required super.backPath,
      required super.releaseDate,
      required super.rate});

  factory AllMoviesDataModel.fromJson(Map<String, dynamic> json) =>
      AllMoviesDataModel(
        id: json["id"],
        firebaseId: json["firebaseId"],
        title: json["title"],
        releaseDate: json["release_date"],
        rate: json["vote_average"],
        backPath: json["backdrop_path"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "firebaseId": firebaseId,
      "title": title,
      "release_date": releaseDate,
      "vote_average": rate,
      "backdrop_path": backPath,
    };
  }
}
