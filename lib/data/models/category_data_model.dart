import 'package:movies_project/domain/entities/category_model.dart';

class CategoryDataModel extends CategoryModel {
  CategoryDataModel({required super.id, required super.name});

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      CategoryDataModel(id: json["id"], name: json["name"]);
}
