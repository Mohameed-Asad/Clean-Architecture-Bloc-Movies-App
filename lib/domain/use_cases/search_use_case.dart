import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/search_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class SearchUseCase {
  final SearchRepository repository;

  SearchUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute(String query) async {
    return await repository.getSearchMovies(query);
  }
}
