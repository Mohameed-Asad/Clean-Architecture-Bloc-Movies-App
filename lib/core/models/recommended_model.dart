class RecommendedModel {
  final String title;
  final double rate;
  final String posterPath;
  final String releaseDate;

  RecommendedModel(
      {required this.title,
      required this.rate,
      required this.posterPath,
      required this.releaseDate});

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      RecommendedModel(
          title: json["title"],
          rate: json["vote_average"],
          posterPath: json["poster_path"],
          releaseDate: json["release_date"]);
}
