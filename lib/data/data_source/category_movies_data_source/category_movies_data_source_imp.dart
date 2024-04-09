import 'package:dio/dio.dart';
import 'package:movies_project/data/data_source/category_movies_data_source/category_movies_data_source.dart';

class CategoryMoviesDataSourceImp implements CategoryMoviesDataSource {
  final Dio dio;

  CategoryMoviesDataSourceImp(this.dio);

  @override
  Future<Response> getCategoryMovies(String genresId) async {
    return await dio
        .get("/3/discover/movie", queryParameters: {"with_genres": genresId});
  }
}
