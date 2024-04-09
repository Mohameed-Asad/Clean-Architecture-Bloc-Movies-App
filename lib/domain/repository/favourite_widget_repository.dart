import '../entities/all_movies_model.dart';

abstract class FavouriteWidgetRepository {
  Future<void> addFavourite(AllMoviesModel model);

  Future<void> removeFavourite(AllMoviesModel model);
}
