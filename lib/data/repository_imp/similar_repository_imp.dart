import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/similar_data_source/similar_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/similar_repository.dart';

import '../../core/failure/server_failures.dart';
import '../models/all_movies_model.dart';

class SimilarRepositoryImp implements SimilarRepository {
  final SimilarDataSource dataSource;

  SimilarRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getSimilarMovies(
      int movieId) async {
    try {
      final response = await dataSource.getSimilarMovies(movieId);
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> similarMovies = [];
        for (var e in dataList) {
          similarMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(similarMovies);
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
