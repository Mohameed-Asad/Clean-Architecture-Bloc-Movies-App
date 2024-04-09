import '../../../../../domain/entities/all_movies_model.dart';

sealed class CategoryMoviesStates {}

class LoadingMoviesStates extends CategoryMoviesStates {}

class ErrorMoviesStates extends CategoryMoviesStates {}

class SuccessMoviesStates extends CategoryMoviesStates {
  final List<AllMoviesModel> categoryMovies;

  SuccessMoviesStates(this.categoryMovies);
}
