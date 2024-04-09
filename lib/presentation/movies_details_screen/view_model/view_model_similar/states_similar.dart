import '../../../../domain/entities/all_movies_model.dart';

sealed class SimilarStates {}

class LoadingSimilarState extends SimilarStates {}

class ErrorSimilarState extends SimilarStates {}

class SuccessSimilarState extends SimilarStates {
  final List<AllMoviesModel> similarList;

  SuccessSimilarState(this.similarList);
}
