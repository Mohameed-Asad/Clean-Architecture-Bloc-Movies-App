import '../../../../../domain/entities/all_movies_model.dart';

sealed class ReleaseStates {}

class LoadingReleaseStates extends ReleaseStates {}

class SuccessReleaseStates extends ReleaseStates {
  final List<AllMoviesModel> releaseList;

  SuccessReleaseStates(this.releaseList);
}

class ErrorReleaseStates extends ReleaseStates {}
