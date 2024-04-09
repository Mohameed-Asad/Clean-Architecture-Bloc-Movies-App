import 'package:dio/dio.dart';

abstract class SimilarDataSource {
  Future<Response> getSimilarMovies(int movieId);
}
