import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';

import '../../core/failure/failure.dart';

abstract class ReleaseRepository {
  Future<Either<Failure, List<AllMoviesModel>>> getReleaseMovies();
}
