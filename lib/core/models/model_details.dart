class ModelDetails {
  int? id;
  String? backPath;
  String? posterPath;
  String? title;
  String? releaseDate;
  String? description;
  double? rate;
  List<KindOfMovie>? kinds;

  ModelDetails(
      {this.id,
      this.backPath,
      this.posterPath,
      this.title,
      this.releaseDate,
      this.description,
      this.rate,
      this.kinds});

  ModelDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    backPath = json["backdrop_path"];
    posterPath = json["poster_path"];
    title = json["title"];
    releaseDate = json["release_date"];
    description = json["overview"];
    rate = json["vote_average"];
    if (json["genres"] != null) {
      kinds = [];
      json["genres"].forEach((e) {
        kinds?.add(KindOfMovie.fromJson(e));
      });
    }
  }
}

class KindOfMovie {
  final String name;

  KindOfMovie({required this.name});

  factory KindOfMovie.fromJson(Map<String, dynamic> json) =>
      KindOfMovie(name: json["name"]);
}
