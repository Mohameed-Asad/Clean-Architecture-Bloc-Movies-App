import '../../../../../domain/entities/all_movies_model.dart';

sealed class RecommendedStates {}

class LoadingRecommendedState extends RecommendedStates {}

class SuccessRecommendedState extends RecommendedStates {
  final List<AllMoviesModel> recommendedList;

  SuccessRecommendedState(this.recommendedList);
}

class ErrorRecommendedState extends RecommendedStates {}
