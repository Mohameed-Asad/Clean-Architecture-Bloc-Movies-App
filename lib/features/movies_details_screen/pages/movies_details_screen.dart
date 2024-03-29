import 'package:flutter/material.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/network/api_manager.dart';

import '../widgets/movie_details_widget.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var movieId = ModalRoute.of(context)?.settings.arguments as AllMoviesId;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(movieId.name),
          ),
          body: FutureBuilder(
              future: ApiManager.getModelDetails(movieId.id),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                var model = snapshot.data;
                print(movieId.id);
                return MovieDetailsWidget(modelDetails: model!);
              })),
    );
  }
}
