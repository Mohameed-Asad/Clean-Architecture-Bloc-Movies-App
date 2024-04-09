class AllMoviesModel {
  int? id;
  String? firebaseId;
  String? title;
  String? posterPath;
  String? backPath;
  String? releaseDate;
  double? rate;

  AllMoviesModel(
      {this.id,
      this.firebaseId,
      this.title,
      this.posterPath,
      this.backPath,
      this.releaseDate,
      this.rate});
}
