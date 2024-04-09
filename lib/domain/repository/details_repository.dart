import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/entities/details_model.dart';

import '../../core/failure/failure.dart';

abstract class DetailsRepository {
  Future<Either<Failure, DetailsModel>> getMoviesDetails(int movieId);
}
