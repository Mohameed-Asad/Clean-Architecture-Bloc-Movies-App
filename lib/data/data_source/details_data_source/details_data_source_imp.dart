import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/details_data_source/details_data_source.dart';

class DetailsDataSourceImp implements DetailsDataSource {
  final Dio dio;

  DetailsDataSourceImp(this.dio);

  @override
  Future<Response> getMoviesDetails(int movieId) async {
    return await dio
        .get("/3/movie/$movieId", queryParameters: {"movie_id": movieId});
  }
}
