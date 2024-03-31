import 'package:movies_project/core/models/allmovies_model.dart';

class SearchModel extends AllMoviesModel {
  SearchModel({
    int? id,
    String? releaseDate,
    String? title,
    String? backPath,
    double? rate,
  }) : super(
          id: id,
          title: title,
          releaseDate: releaseDate,
          backPath: backPath,
          rate: rate,
        );

  @override
  SearchModel fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json["id"],
      title: json["title"],
      releaseDate: json["release_date"],
      rate: json["vote_average"],
      backPath: json["backdrop_path"],
    );
  }
}
