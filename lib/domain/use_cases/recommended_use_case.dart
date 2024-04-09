import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/recommended_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class RecommendedUseCase {
  final RecommendedRepository repository;

  RecommendedUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute() async {
    return await repository.getRecommendedMovies();
  }
}
