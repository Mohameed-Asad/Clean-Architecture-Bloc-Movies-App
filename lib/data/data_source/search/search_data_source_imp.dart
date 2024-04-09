import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/search/search_data_source.dart';

class SearchDataSourceImp implements SearchDataSource {
  final Dio dio;

  SearchDataSourceImp(this.dio);

  @override
  Future<Response> searchMovies(String query) async {
    return await dio.get("/3/search/movie", queryParameters: {"query": query});
  }
}
