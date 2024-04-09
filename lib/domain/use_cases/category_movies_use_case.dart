import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/category_movies_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/all_movies_model.dart';

class CategoryMoviesUseCase {
  final CategoryMoviesRepository repository;

  CategoryMoviesUseCase(this.repository);

  Future<Either<Failure, List<AllMoviesModel>>> execute(String genresId) async {
    return await repository.getCategoryMovies(genresId);
  }
}
