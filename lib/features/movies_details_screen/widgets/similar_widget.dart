import 'package:flutter/material.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/models/similar_model.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/core/widgets/add_favourite.dart';
import 'package:movies_project/main.dart';

import '../../../core/config/Constants.dart';
import '../../../core/config/app_theme_manager.dart';

class SimilarWidget extends StatelessWidget {
  final SimilarModel similarModel;

  const SimilarWidget({super.key, required this.similarModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: Constants.mediaQuery.width * 0.21,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        FavoriteWidget(
            newImage: AspectRatio(
          aspectRatio: 1,
          child: GestureDetector(
            onTap: () {
              navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
                  arguments: AllMoviesId(
                      id: similarModel.id!, name: similarModel.title));
            },
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5), topLeft: Radius.circular(5)),
              child: Image.network(
                "${Constants.imagePath}${similarModel.posterPath}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        )),
        Container(
          margin: const EdgeInsets.only(bottom: 3, left: 5, top: 5, right: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: AppThemeManager.primaryColor,
                    size: 11,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  Text(
                    "${similarModel.rate}",
                    style: Constants.theme.textTheme.displaySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                similarModel.title,
                style: Constants.theme.textTheme.displaySmall
                    ?.copyWith(height: 1.1),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(similarModel.releaseDate,
                  style: Constants.theme.textTheme.displaySmall
                      ?.copyWith(color: Colors.grey))
            ],
          ),
        )
      ]),
    );
  }
}
