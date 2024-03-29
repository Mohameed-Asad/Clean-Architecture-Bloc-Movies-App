import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/release_model.dart';
import 'package:movies_project/core/widgets/add_favourite.dart';

import '../../../core/models/allmovies_model.dart';
import '../../../core/route_manager/routes_names.dart';
import '../../../main.dart';

class ReleaseMoviesWidget extends StatelessWidget {
  final ReleaseModel releaseModel;

  const ReleaseMoviesWidget({super.key, required this.releaseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 13, right: 15),
        child: FavoriteWidget(
            newImage: GestureDetector(
                onTap: () {
                  navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
                      arguments: AllMoviesId(
                          id: releaseModel.id!, name: releaseModel.title!));
                },
                child: Image.network(
                    "${Constants.imagePath}${releaseModel.posterPath}"))));
  }
}
