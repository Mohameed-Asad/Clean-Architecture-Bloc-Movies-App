import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';

import '../../core/failure/failure.dart';

abstract class WatchListRepository {
  Future<Either<Failure, List<AllMoviesModel>>> getWatchList();
}
