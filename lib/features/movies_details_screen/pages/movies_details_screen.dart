import 'package:flutter/material.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/models/model_details.dart';
import 'package:movies_project/core/network/api_manager.dart';

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
                var model = snapshot.data ??
                    ModelDetails(
                      posterPath: "",
                      title: "",
                      releaseDate: "",
                      backPath: "",
                      description: "",
                      rate: 0,
                    );
                print(model.description);
                return Text(model.title);
              })),
    );
  }
}
