import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/release_data_source/release_data_source.dart';

class ReleaseDataSourceImp implements ReleaseDataSource {
  final Dio dio;

  ReleaseDataSourceImp(this.dio);

  @override
  Future<Response> getReleaseMovies() async {
    return await dio.get("/3/movie/upcoming");
  }
}
