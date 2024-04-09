import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/recommended_data_source/recommended_data_source.dart';

class RecommendedDataSourceImp implements RecommendedDataSource {
  final Dio dio;

  RecommendedDataSourceImp(this.dio);

  @override
  Future<Response> getRecommendedMovies() async {
    return await dio.get("/3/movie/top_rated");
  }
}
