import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/details_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/details_model.dart';

class DetailsUseCase {
  final DetailsRepository repository;

  DetailsUseCase(this.repository);

  Future<Either<Failure, DetailsModel>> execute(int movieId) async {
    return await repository.getMoviesDetails(movieId);
  }
}
