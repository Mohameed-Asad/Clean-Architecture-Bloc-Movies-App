import 'package:dio/dio.dart';

abstract class ReleaseDataSource {
  Future<Response> getReleaseMovies();
}
