import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/recommended_model.dart';
import 'package:movies_project/core/models/release_model.dart';

import '../models/popular_model.dart';

class ApiManager {
  static Future<List<PopularModel>> getPopularMovies() async {
    var url = Uri.https(
        Constants.baseUrl, "/3/movie/popular", {"apiKey": Constants.apiKey});

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<PopularModel> popularModel = [];
      for (var e in dataList) {
        popularModel.add(PopularModel.fromJson(e));
      }
      return popularModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }
  static Future<List<ReleaseModel>> getReleaseMovies() async {
    var url = Uri.https(
        Constants.baseUrl, "/3/movie/upcoming", {"apiKey": Constants.apiKey});

    final response = await http.get(url, headers: {
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<ReleaseModel> releaseModel = [];
      for (var e in dataList) {
        releaseModel.add(ReleaseModel.fromJson(e));
      }
      return releaseModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }
  static Future<List<RecommendedModel>> getRecommendedMovies() async {
    var url = Uri.https(
        Constants.baseUrl, "/3/movie/top_rated", {"apiKey": Constants.apiKey});

    final response = await http.get(url, headers: {
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<RecommendedModel> recommendedModel = [];
      for (var e in dataList) {
        recommendedModel.add(RecommendedModel.fromJson(e));
      }
      return recommendedModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

}
