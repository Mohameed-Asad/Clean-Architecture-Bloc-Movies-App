import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/release_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class GetReleaseUseCase {
  final ReleaseRepository repository;

  GetReleaseUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute() async {
    return await repository.getReleaseMovies();
  }
}
