import 'package:flutter/material.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/network/api_manager.dart';

import '../widgets/movie_details_widget.dart';

class MoviesDetails extends StatelessWidget {
  const MoviesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var movieDetails =
        ModalRoute.of(context)?.settings.arguments as AllMoviesModel;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(movieDetails.title!),
          ),
          body: FutureBuilder(
              future: ApiManager.getModelDetails(movieDetails.id!),
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
                return MovieDetailsWidget(modelDetails: model!);
              })),
    );
  }
}
