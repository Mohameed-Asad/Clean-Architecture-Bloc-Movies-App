class AllMoviesModel {
  int? id;
  String? title;
  String? posterPath;
  String? backPath;
  String? releaseDate;
  double? rate;
  String? firebaseId;

  AllMoviesModel({
    this.id,
    this.title,
    this.posterPath,
    this.releaseDate,
    this.backPath,
    this.rate,
    this.firebaseId,
  });

  fromJson(Map<String, dynamic> json) {
    return AllMoviesModel(
      firebaseId: json["id"],
      title: json["title"],
      releaseDate: json["release_date"],
      rate: json["vote_average"],
      backPath: json["backdrop_path"],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      "id": firebaseId,
      "title": title,
      "release_date": releaseDate,
      "vote_average": rate,
      "backdrop_path": backPath
    };
  }
}
