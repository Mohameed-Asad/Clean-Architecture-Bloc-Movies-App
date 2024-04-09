import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/watchlist_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class GetWatchListDataUseCase {
  final WatchListRepository repository;

  GetWatchListDataUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel?>>> execute() async {
    return await repository.getWatchList();
  }
}
