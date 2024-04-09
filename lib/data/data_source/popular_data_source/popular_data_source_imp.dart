import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/popular_data_source/popular_data_source.dart';

class PopularDataSourceImp implements PopularDataSource {
  final Dio dio;

  PopularDataSourceImp(this.dio);

  @override
  Future<Response> getPopularMovies() async {
    return await dio.get("/3/movie/popular");
  }
}
