import 'package:dio/dio.dart';

abstract class SearchDataSource {
  Future<Response> searchMovies(String query);
}
