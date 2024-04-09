import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/release_data_source/release_data_source.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/domain/repository/release_repository.dart';

import '../../core/failure/server_failures.dart';
import '../models/all_movies_model.dart';

class ReleaseRepositoryImp implements ReleaseRepository {
  final ReleaseDataSource dataSource;

  ReleaseRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<AllMoviesModel>>> getReleaseMovies() async {
    try {
      final response = await dataSource.getReleaseMovies();
      if (response.statusCode == 200) {
        var dataList = response.data["results"] as List;
        List<AllMoviesModel> releaseMovies = [];
        for (var e in dataList) {
          releaseMovies.add(AllMoviesDataModel.fromJson(e));
        }
        return Right(releaseMovies);
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
