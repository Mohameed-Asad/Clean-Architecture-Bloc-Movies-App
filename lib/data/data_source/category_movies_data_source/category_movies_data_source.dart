import 'package:dio/dio.dart';

abstract class CategoryMoviesDataSource {
  Future<Response> getCategoryMovies(String genresId);
}
