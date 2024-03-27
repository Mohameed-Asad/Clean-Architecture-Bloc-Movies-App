import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';

import '../../../core/models/popular_model.dart';

class PopularMoviesWidget extends StatelessWidget {
  final PopularModel popularMovies;

  const PopularMoviesWidget({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: NetworkImage(
                  "${Constants.imagePath}${popularMovies.backPath}",
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.bottomLeft,
                  width: Constants.mediaQuery.width * 0.33,
                  height: Constants.mediaQuery.height * 0.2,
                  child: Image.network(
                      "${Constants.imagePath}${popularMovies.posterPath}"),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 170,bottom: 25,
            top: 230),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [Text(popularMovies.title,
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    height: 1,),
                  textAlign: TextAlign.start,),
                  const SizedBox(height: 5,),
                  Text(popularMovies.releaseDate,
                style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey
                ),
                textAlign: TextAlign.start,),],
              ),
          ),
        ],

    );
  }
}
