import '../../../domain/entities/all_movies_model.dart';

sealed class SearchStates {}

class LoadingSearchState extends SearchStates {}

class ErrorSearchState extends SearchStates {}

class SuccessSearchState extends SearchStates {
  final List<AllMoviesModel> searchList;

  SuccessSearchState(this.searchList);
}
