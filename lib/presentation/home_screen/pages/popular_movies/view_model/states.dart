import '../../../../../domain/entities/all_movies_model.dart';

sealed class PopularStates {}

class LoadingPopularState extends PopularStates {}

class SuccessPopularState extends PopularStates {
  final List<AllMoviesModel> popularList;

  SuccessPopularState(this.popularList);
}

class ErrorPopularState extends PopularStates {}
