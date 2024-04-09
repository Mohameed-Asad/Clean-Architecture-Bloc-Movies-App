import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/search/search_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/search_repository.dart';

import '../../core/failure/server_failures.dart';
import '../models/all_movies_model.dart';

class SearchRepositoryImp implements SearchRepository {
  final SearchDataSource dataSource;

  SearchRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getSearchMovies(
      String query) async {
    try {
      final response = await dataSource.searchMovies(query);
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> searchMovies = [];
        for (var e in dataList) {
          searchMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(searchMovies);
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
