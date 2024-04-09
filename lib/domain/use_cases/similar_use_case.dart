import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/similar_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class SimilarUseCase {
  final SimilarRepository repository;

  SimilarUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute(int movieId) async {
    return await repository.getSimilarMovies(movieId);
  }
}
