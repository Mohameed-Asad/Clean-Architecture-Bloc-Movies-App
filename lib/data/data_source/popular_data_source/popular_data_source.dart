import 'package:dio/dio.dart';

abstract class PopularDataSource {
  Future<Response> getPopularMovies();
}
