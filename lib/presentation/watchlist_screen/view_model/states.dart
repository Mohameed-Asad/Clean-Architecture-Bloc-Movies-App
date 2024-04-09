import '../../../domain/entities/all_movies_model.dart';

sealed class WatchListStates {}

class LoadingWatchList extends WatchListStates {}

class ErrorWatchList extends WatchListStates {}

class SuccessGetWatchList extends WatchListStates {
  final List<AllMoviesModel?> watchList;

  SuccessGetWatchList(this.watchList);
}
