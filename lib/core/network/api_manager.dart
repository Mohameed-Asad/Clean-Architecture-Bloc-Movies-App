import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_project/core/config/Constants.dart';

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
}
