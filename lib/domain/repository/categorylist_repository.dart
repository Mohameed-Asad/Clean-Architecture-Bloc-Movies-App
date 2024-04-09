import 'package:dartz/dartz.dart';
import 'package:movies_project/core/failure/failure.dart';
import 'package:movies_project/domain/entities/category_model.dart';

abstract class CategoryListRepository {
  Future<Either<Failure, List<CategoryModel>>> getCategoryList();
}
