import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/widgets/add_favourite/view_model/states.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source.dart';
import 'package:movies_project/data/data_source/watchlist_data_source/watchlist_data_source_imp.dart';
import 'package:movies_project/data/repository_imp/favourite_widget_repository_imp.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/favourite_widget_repository.dart';
import 'package:movies_project/domain/use_cases/favourite_widget_use_cases/add_favourite_use_case.dart';
import 'package:movies_project/domain/use_cases/favourite_widget_use_cases/remove_favourite_use_case.dart';

class FavouriteViewModel extends Cubit<FavouriteWidgetStates> {
  FavouriteViewModel() : super(RemoveFavouriteState());

  late AddFavouriteUseCase addUseCase;
  late RemoveFavouriteUseCase removeUseCase;
  late FavouriteWidgetRepository repository;
  late WatchListDataSource dataSource;

  Future<void> addFavourite(AllMoviesModel model) {
    dataSource = WatchListDataSourceImp();
    repository = FavouriteWidgetRepositoryImp(dataSource);
    addUseCase = AddFavouriteUseCase(repository);
    emit(AddFavouriteState());
    return addUseCase.execute(model);
  }

  Future<void> removeFavourite(AllMoviesModel model) {
    dataSource = WatchListDataSourceImp();
    repository = FavouriteWidgetRepositoryImp(dataSource);
    removeUseCase = RemoveFavouriteUseCase(repository);
    emit(RemoveFavouriteState());
    return removeUseCase.execute(model);
  }
}
