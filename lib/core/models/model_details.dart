class ModelDetails {
  final String backPath;
  final String posterPath;
  final String title;
  final String releaseDate;
  final String description;
  final double rate;

  // final List<KindOfMovie> kinds;

  ModelDetails({
    required this.backPath,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.description,
    required this.rate,
  });

  factory ModelDetails.fromJson(Map<String, dynamic> json) => ModelDetails(
        backPath: json["backdrop_path"],
        posterPath: json["poster_path"],
        title: json["title"],
        releaseDate: json["release_date"],
        description: json["overview"],
        rate: json["vote_average"],
      );
}

class KindOfMovie {
  int? id;
  String? name;
}
