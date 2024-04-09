import 'package:dio/dio.dart';

abstract class DetailsDataSource {
  Future<Response> getMoviesDetails(int movieId);
}
