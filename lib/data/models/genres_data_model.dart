import 'package:movies_project/domain/entities/genres_model.dart';

class GenresDataModel extends GenresModel {
  GenresDataModel({required super.name});

  factory GenresDataModel.fromJson(Map<String, dynamic> json) =>
      GenresDataModel(name: json["name"]);
}
