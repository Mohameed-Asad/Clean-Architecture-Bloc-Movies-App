import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/genres_model.dart';
import 'package:movies_project/core/models/model_details.dart';
import 'package:movies_project/core/models/recommended_model.dart';
import 'package:movies_project/core/models/search_model.dart';

import '../models/popular_model.dart';
import '../models/release_model.dart';
import '../models/similar_model.dart';

class ApiManager {
  // Function to get popularMovies
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
        popularModel.add(PopularModel().fromJson(e));
      }
      return popularModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get ReleaseMovies
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
        releaseModel.add(ReleaseModel().fromJson(e));
      }
      return releaseModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get RecommendedMovies
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
        recommendedModel.add(RecommendedModel().fromJson(e));
      }
      return recommendedModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get ModelDetails
  static Future<ModelDetails> getModelDetails(int movieId) async {
    var url = Uri.https(Constants.baseUrl, "/3/movie/$movieId",
        {"apiKey": Constants.apiKey, "movie_id": "$movieId"});

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ModelDetails modelDetails = ModelDetails().fromJson(data);
      return modelDetails;
    } else {
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get moreLike This Movies
  static Future<List<SimilarModel>> getSimilarMovies(int movieId) async {
    var url = Uri.https(Constants.baseUrl, "/3/movie/$movieId/similar",
        {"apiKey": Constants.apiKey, "movie_id": "$movieId"});

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<SimilarModel> similarModel = [];
      for (var e in dataList) {
        similarModel.add(SimilarModel().fromJson(e));
      }
      return similarModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to search for Movies
  static Future<List<SearchModel>> searchMovies(String query) async {
    var url = Uri.https(Constants.baseUrl, "/3/search/movie",
        {"apiKey": Constants.apiKey, "query": query});

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<SearchModel> searchModel = [];
      for (var e in dataList) {
        searchModel.add(SearchModel().fromJson(e));
      }
      return searchModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get Categories
  static Future<List<GenresModel>> getCategories() async {
    var url = Uri.https(
        Constants.baseUrl, "/3/genre/movie/list", {"apiKey": Constants.apiKey});

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["genres"] as List;
      List<GenresModel> genresModel = [];
      for (var e in dataList) {
        genresModel.add(GenresModel.fromJson(e));
      }
      return genresModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }

  // Function to get CategoriesList
  static Future<List<SearchModel>> getCategoriesList(String genresId) async {
    var url = Uri.https(Constants.baseUrl, "/3/discover/movie", {
      "apiKey": Constants.apiKey,
      "with_genres": genresId,
    });

    final response = await http.get(url, headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1MGRiM2VjODhhN2Q3NmIzMjM4YzU2YWEyMTE1ZjE4MSIsInN1YiI6IjY2MDFjZDJjZDM4YjU4MDE0YTE5NmE3OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.KcXh3PKk-gHo3ryEmbFmRBt4eSpcpNQqV4K4MYT5M3w"
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      var dataList = data["results"] as List;
      List<SearchModel> searchModel = [];
      for (var e in dataList) {
        searchModel.add(SearchModel().fromJson(e));
      }
      return searchModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load popularMovies');
    }
  }
}
