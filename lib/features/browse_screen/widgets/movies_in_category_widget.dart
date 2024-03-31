import 'package:flutter/material.dart';

import '../../../core/config/Constants.dart';
import '../../../core/config/app_theme_manager.dart';
import '../../../core/models/search_model.dart';
import '../../../core/route_manager/routes_names.dart';
import '../../../main.dart';

class MoviesInCategory extends StatelessWidget {
  final SearchModel searchModel;

  const MoviesInCategory({super.key, required this.searchModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
            arguments:
                SearchModel(id: searchModel.id, title: searchModel.title));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 3, left: 3, right: 3),
        margin: const EdgeInsets.only(bottom: 10),
        height: Constants.mediaQuery.height * 0.12,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: Constants.mediaQuery.width * 0.36,
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        "${Constants.imagePath}${searchModel.backPath}",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        searchModel.title!,
                        style: Constants.theme.textTheme.bodySmall
                            ?.copyWith(height: 1.1),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        searchModel.releaseDate!,
                        style: Constants.theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppThemeManager.primaryColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${searchModel.rate}",
                            style:
                                Constants.theme.textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1.3,
            )
          ],
        ),
      ),
    );
  }
}
