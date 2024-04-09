import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/similar_data_source/similar_data_source.dart';

class SimilarDataSourceImp implements SimilarDataSource {
  final Dio dio;

  SimilarDataSourceImp(this.dio);

  @override
  Future<Response> getSimilarMovies(int movieId) async {
    return await dio.get("/3/movie/$movieId/similar",
        queryParameters: {"movie_id": movieId});
  }
}
