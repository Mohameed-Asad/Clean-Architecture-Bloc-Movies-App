import 'package:dio/dio.dart';

abstract class RecommendedDataSource {
  Future<Response> getRecommendedMovies();
}
