import 'package:dartz/dartz.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

abstract class RecommendedRepository {
  Future<Either<Failure, List<AllMoviesModel>>> getRecommendedMovies();
}
