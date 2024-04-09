import 'package:dio/dio.dart';

abstract class CategoryListDataSource {
  Future<Response> getCategoriesList();
}
