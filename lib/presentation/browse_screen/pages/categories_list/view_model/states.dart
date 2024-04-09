import '../../../../../domain/entities/category_model.dart';

sealed class CategoryListStates {}

class LoadingCategoryListState extends CategoryListStates {}

class ErrorCategoryListState extends CategoryListStates {}

class SuccessCategoryListState extends CategoryListStates {
  final List<CategoryModel> categoryList;

  SuccessCategoryListState(this.categoryList);
}
