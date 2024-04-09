import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/details_data_source/details_data_source.dart';
import 'package:movies_project/data/models/details_data_model.dart';
import 'package:movies_project/domain/entities/details_model.dart';
import 'package:movies_project/domain/repository/details_repository.dart';

import '../../core/failure/server_failures.dart';

class DetailsRepositoryImp implements DetailsRepository {
  final DetailsDataSource dataSource;

  DetailsRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, DetailsModel>> getMoviesDetails(int movieId) async {
    try {
      final response = await dataSource.getMoviesDetails(movieId);
      if (response.statusCode == 200) {
        DetailsModel detailsModel = DetailsDataModel.fromJson(response.data);
        return Right(detailsModel);
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
