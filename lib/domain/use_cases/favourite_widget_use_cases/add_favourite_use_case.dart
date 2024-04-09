import 'package:movies_project/domain/repository/favourite_widget_repository.dart';

import '../../entities/all_movies_model.dart';

class AddFavouriteUseCase {
  final FavouriteWidgetRepository repository;

  AddFavouriteUseCase(this.repository);

  Future<void> execute(AllMoviesModel model) {
    return repository.addFavourite(model);
  }
}
