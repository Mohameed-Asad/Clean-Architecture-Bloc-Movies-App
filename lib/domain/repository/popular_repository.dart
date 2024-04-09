import 'package:dartz/dartz.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';

abstract class PopularRepository {
  Future<Either<Failure, List<AllMoviesModel>>> getPopularMovies();
}