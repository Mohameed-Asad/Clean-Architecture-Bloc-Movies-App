import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/main.dart';

import '../../../core/models/popular_model.dart';

class PopularMoviesWidget extends StatefulWidget {
  final PopularModel popularMovies;

  const PopularMoviesWidget({super.key, required this.popularMovies});

  @override
  State<PopularMoviesWidget> createState() => _PopularMoviesWidgetState();
}

class _PopularMoviesWidgetState extends State<PopularMoviesWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
            arguments: AllMoviesId(
                id: widget.popularMovies.id, name: widget.popularMovies.title));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: NetworkImage(
                  "${Constants.imagePath}${widget.popularMovies.backPath}",
                ),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  alignment: Alignment.bottomLeft,
                  width: Constants.mediaQuery.width * 0.33,
                  height: Constants.mediaQuery.height * 0.2,
                  child: Stack(
                    children: [
                      Image.network(
                          "${Constants.imagePath}${widget.popularMovies.posterPath}"),
                      if (!isClicked)
                        Image.asset(
                          "assets/Images/favorite.png",
                        ),
                      if (!isClicked)
                        Positioned(
                            top: -10,
                            left: -11,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 20,
                              ),
                            )),
                      if (isClicked) Image.asset("assets/Images/bookmark.png"),
                      if (isClicked)
                        Positioned(
                            top: -10,
                            left: -11,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isClicked = !isClicked;
                                });
                              },
                              icon: const Icon(
                                Icons.check_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                            )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 170, bottom: 25, top: 230),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  widget.popularMovies.title,
                  style: Constants.theme.textTheme.bodyLarge?.copyWith(
                    height: 1,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.popularMovies.releaseDate,
                  style: Constants.theme.textTheme.bodyMedium
                      ?.copyWith(color: Colors.grey),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
