class ReleaseModel {
  int? id;
  String? title;
  final String posterPath;

  ReleaseModel({this.id, this.title, required this.posterPath});

  factory ReleaseModel.fromJson(Map<String, dynamic> json) => ReleaseModel(
      id: json["id"], title: json["title"], posterPath: json["poster_path"]);
}
