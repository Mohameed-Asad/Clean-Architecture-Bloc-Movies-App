import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/popular_repository.dart';

import '../../core/failure/failure.dart';

class GetPopularUseCase {
  final PopularRepository repository;

  GetPopularUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute() async {
    return await repository.getPopularMovies();
  }
}
