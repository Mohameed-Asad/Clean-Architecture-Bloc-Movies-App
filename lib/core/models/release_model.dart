class ReleaseModel {
  final String posterPath;

  ReleaseModel({required this.posterPath});

  factory ReleaseModel.fromJson(Map<String, dynamic> json) => ReleaseModel(
  posterPath: json["poster_path"]);
}