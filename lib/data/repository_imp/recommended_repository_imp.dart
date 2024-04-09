import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/recommended_data_source/recommended_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/recommended_repository.dart';

import '../../core/failure/server_failures.dart';
import '../models/all_movies_model.dart';

class RecommendedRepositoryImp implements RecommendedRepository {
  final RecommendedDataSource dataSource;

  RecommendedRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getRecommendedMovies() async {
    try {
      final response = await dataSource.getRecommendedMovies();
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> recommendedMovies = [];
        for (var e in dataList) {
          recommendedMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(recommendedMovies);
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
