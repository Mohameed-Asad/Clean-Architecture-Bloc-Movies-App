import 'package:dartz/dartz.dart';
import 'package:movies_project/domain/repository/categorylist_repository.dart';

import '../../core/failure/failure.dart';
import '../entities/category_model.dart';

class CategoryListUseCase {
  final CategoryListRepository repository;

  CategoryListUseCase(this.repository);

  Future<Either<Failure, List<CategoryModel>>> execute() async {
    return await repository.getCategoryList();
  }
}
