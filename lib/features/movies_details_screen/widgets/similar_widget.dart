import 'package:flutter/material.dart';
import 'package:movies_project/core/widgets/add_favourite.dart';

import '../../../core/config/Constants.dart';
import '../../../core/config/app_theme_manager.dart';
import '../../../core/models/recommended_model.dart';

class SimilarWidget extends StatelessWidget {
  final RecommendedModel recommendedModel;

  const SimilarWidget({super.key, required this.recommendedModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: Constants.mediaQuery.height * 0.13,
      width: Constants.mediaQuery.width * 0.21,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        FavoriteWidget(
            newImage: Image.network(
          "${Constants.imagePath}${recommendedModel.posterPath}",
          height: 78,
        )),
        Container(
          margin: const EdgeInsets.only(bottom: 1, left: 5, top: 3, right: 2),
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
                style: Constants.theme.textTheme.displaySmall,
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
