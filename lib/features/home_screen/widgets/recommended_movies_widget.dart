import 'package:flutter/material.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/models/recommended_model.dart';
import 'package:movies_project/core/widgets/add_favourite.dart';

import '../../../core/config/Constants.dart';
import '../../../core/models/allmovies_model.dart';
import '../../../core/route_manager/routes_names.dart';
import '../../../main.dart';

class RecommendedMoviesWidget extends StatelessWidget {
  final RecommendedModel recommendedModel;

  const RecommendedMoviesWidget({super.key, required this.recommendedModel});

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
            newImage: GestureDetector(
          onTap: () {
            navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
                arguments: AllMoviesId(
                    id: recommendedModel.id!, name: recommendedModel.title));
          },
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              child: Image.network(
                "${Constants.imagePath}${recommendedModel.posterPath}",
                fit: BoxFit.fill,
              ),
            ),
          ),
        )),
        Container(
          margin: const EdgeInsets.only(bottom: 2, left: 5, top: 3, right: 2),
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
                    "${recommendedModel.rate}",
                    style: Constants.theme.textTheme.displaySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                recommendedModel.title,
                style: Constants.theme.textTheme.displaySmall
                    ?.copyWith(height: 1.1),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(recommendedModel.releaseDate,
                  style: Constants.theme.textTheme.displaySmall
                      ?.copyWith(color: Colors.grey))
            ],
          ),
        )
      ]),
    );
  }
}
