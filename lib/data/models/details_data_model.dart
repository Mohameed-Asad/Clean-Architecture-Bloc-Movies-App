import 'package:movies_project/data/models/genres_data_model.dart';
import 'package:movies_project/domain/entities/details_model.dart';

class DetailsDataModel extends DetailsModel {
  DetailsDataModel(
      {required super.id,
      required super.title,
      required super.posterPath,
      required super.backPath,
      required super.releaseDate,
      required super.rate,
      required super.description,
      required super.kinds});

  factory DetailsDataModel.fromJson(Map<String, dynamic> json) {
    List<GenresDataModel> genresList = [];
    json["genres"].forEach((e) {
      genresList.add(GenresDataModel.fromJson(e));
    });
    return DetailsDataModel(
        id: json["id"],
        backPath: json["backdrop_path"],
        posterPath: json["poster_path"],
        title: json["title"],
        releaseDate: json["release_date"],
        description: json["overview"],
        rate: json["vote_average"],
        kinds: genresList);
  }
}
