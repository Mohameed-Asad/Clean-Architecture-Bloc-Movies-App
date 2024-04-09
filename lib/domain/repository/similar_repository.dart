import 'package:dartz/dartz.dart';
import 'package:movies_project/core/failure/failure.dart';

import '../entities/all_movies_model.dart';

abstract class SimilarRepository {
  Future<Either<Failure, List<AllMoviesModel>>> getSimilarMovies(int movieId);
}
