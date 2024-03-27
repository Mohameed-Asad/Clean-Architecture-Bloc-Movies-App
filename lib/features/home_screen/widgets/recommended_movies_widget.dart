import 'package:flutter/material.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/models/recommended_model.dart';

import '../../../core/config/Constants.dart';

class RecommendedMoviesWidget extends StatefulWidget {
  final RecommendedModel recommendedModel;

  const RecommendedMoviesWidget({super.key, required this.recommendedModel});

  @override
  State<RecommendedMoviesWidget> createState() =>
      _RecommendedMoviesWidgetState();
}

class _RecommendedMoviesWidgetState extends State<RecommendedMoviesWidget> {
  bool isClicked = false;

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
        Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
              child: Image.network(
                  "${Constants.imagePath}${widget.recommendedModel.posterPath}",
                  height: 78),
            ),
            // w),
            if (!isClicked) Image.asset("assets/Images/favorite.png"),
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
                    "${widget.recommendedModel.rate}",
                    style: Constants.theme.textTheme.displaySmall,
                  )
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                widget.recommendedModel.title,
                style: Constants.theme.textTheme.displaySmall,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(widget.recommendedModel.releaseDate,
                  style: Constants.theme.textTheme.displaySmall
                      ?.copyWith(color: Colors.grey))
            ],
          ),
        )
      ]),
    );
  }
}
