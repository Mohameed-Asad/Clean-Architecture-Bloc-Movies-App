class PopularModel {
  final int id;
  final String backPath;
  final String posterPath;
  final String title;
  final String releaseDate;

  PopularModel(
      {required this.id,
      required this.posterPath,
      required this.title,
      required this.releaseDate,
      required this.backPath});

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
      id: json["id"],
      backPath: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
      releaseDate: json["release_date"]);
}
