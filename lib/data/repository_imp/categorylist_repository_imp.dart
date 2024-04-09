import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/data/data_source/categorylist_data_source/categorylist_data_source.dart';
import 'package:movies_project/data/models/category_data_model.dart';
import 'package:movies_project/domain/entities/category_model.dart';
import 'package:movies_project/domain/repository/categorylist_repository.dart';

import '../../core/failure/server_failures.dart';

class CategoryListRepositoryImp implements CategoryListRepository {
  final CategoryListDataSource dataSource;

  CategoryListRepositoryImp(this.dataSource);

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategoryList() async {
    try {
      final response = await dataSource.getCategoriesList();
      if (response.statusCode == 200) {
        var dataList = response.data["genres"] as List;
        List<CategoryModel> categoryModel = [];
        for (var e in dataList) {
          categoryModel.add(CategoryDataModel.fromJson(e));
        }
        return Right(categoryModel);
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
