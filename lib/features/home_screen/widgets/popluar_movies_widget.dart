import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';

import '../../../core/models/popular_model.dart';

class PopularMoviesWidget extends StatelessWidget {
  final PopularModel popularMovies;

  const PopularMoviesWidget({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Stack(
        alignment: Alignment.bottomRight,
          children: [
        Column(children: [
          Image.network(
            "${Constants.imagePath}${popularMovies.backPath}",
          ),
          Row(
            children: [
              Container(
                width: Constants.mediaQuery.width * 0.42,
                height: Constants.mediaQuery.height * 0.23,
                child: Image.network(
                  "${Constants.imagePath}${popularMovies.posterPath}",
                ),
              ),
              Column(children: [Text("Dora"), Text("234234")])
            ],
          ),
        ]),
      ]),
    );
  }
}
