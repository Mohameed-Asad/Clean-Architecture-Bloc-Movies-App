import 'package:movies_project/data/models/genres_data_model.dart';

class DetailsModel {
  final int id;
  final String title;
  final String posterPath;
  final String backPath;
  final String releaseDate;
  final double rate;
  final String description;
  final List<GenresDataModel> kinds;

  DetailsModel(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.backPath,
      required this.releaseDate,
      required this.rate,
      required this.description,
      required this.kinds});
}
