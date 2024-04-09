import 'package:dio/dio.dart';

import 'categorylist_data_source.dart';

class CategoryListDataSourceImp implements CategoryListDataSource {
  final Dio dio;

  CategoryListDataSourceImp(this.dio);

  @override
  Future<Response> getCategoriesList() async {
    return await dio.get("/3/genre/movie/list");
  }
}
