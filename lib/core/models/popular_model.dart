class PopularModel {
  final String backPath;
  final String posterPath;
  final String title;
  final String releaseDate;

  PopularModel(
      {required this.posterPath,
      required this.title,
      required this.releaseDate,
      required this.backPath});

  factory PopularModel.fromJson(Map<String, dynamic> json) => PopularModel(
      backPath: json["backdrop_path"],
      posterPath: json["poster_path"],
      title: json["title"],
      releaseDate: json["release_date"]);
}
