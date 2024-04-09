import 'package:movies_project/domain/repository/favourite_widget_repository.dart';

import '../../entities/all_movies_model.dart';

class RemoveFavouriteUseCase {
  final FavouriteWidgetRepository repository;

  RemoveFavouriteUseCase(this.repository);

  Future<void> execute(AllMoviesModel model) {
    return repository.removeFavourite(model);
  }
}
