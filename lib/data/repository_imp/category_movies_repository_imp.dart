import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/category_movies_data_source/category_movies_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/category_movies_repository.dart';

import '../../core/failure/server_failures.dart';
import '../models/all_movies_model.dart';

class CategoryMoviesRepositoryImp implements CategoryMoviesRepository {
  final CategoryMoviesDataSource dataSource;

  CategoryMoviesRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getCategoryMovies(
      String genresId) async {
    try {
      final response = await dataSource.getCategoryMovies(genresId);
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> categoryMovies = [];
        for (var e in dataList) {
          categoryMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(categoryMovies);
      } else {
        return Left(
          ServerFailure(
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (error) {
      return Left(
        ServerFailure(
          statusCode: error.response?.statusCode.toString() ?? "",
        ),
      );
    }
  }
}
