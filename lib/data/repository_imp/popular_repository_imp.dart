import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/popular_data_source/popular_data_source.dart';
import 'package:movies_project/data/models/all_movies_model.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/popular_repository.dart';

import '../../core/failure/server_failures.dart';

class PopularRepositoryImp implements PopularRepository {
  final PopularDataSource popularDataSource;

  PopularRepositoryImp(this.popularDataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getPopularMovies() async {
    try {
      final response = await popularDataSource.getPopularMovies();
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> popularMovies = [];
        for (var e in dataList) {
          popularMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(popularMovies);
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
