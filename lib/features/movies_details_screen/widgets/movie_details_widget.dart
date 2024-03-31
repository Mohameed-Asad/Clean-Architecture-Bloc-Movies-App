import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/core/widgets/add_favourite.dart';
import 'package:movies_project/features/movies_details_screen/widgets/genres_widget.dart';
import 'package:movies_project/features/movies_details_screen/widgets/similar_widget.dart';

import '../../../core/models/model_details.dart';

class MovieDetailsWidget extends StatelessWidget {
  final ModelDetails modelDetails;

  const MovieDetailsWidget({super.key, required this.modelDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 235,
            color: Colors.transparent,
            child: Image.network(
              "${Constants.imagePath}${modelDetails.backPath}",
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            "${modelDetails.title}",
            style: Constants.theme.textTheme.bodyLarge?.copyWith(height: 1.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 20),
          child: Text(
            "${modelDetails.releaseDate}",
            style: Constants.theme.textTheme.bodySmall
                ?.copyWith(color: Colors.grey),
          ),
        ),
        // Row =
        Container(
          padding: const EdgeInsets.only(left: 20, top: 10, right: 15),
          height: Constants.mediaQuery.height * 0.23,
          child: Row(
            children: [
              // add to favourite Icon and poster imager
              FavoriteWidget(
                  favModel: modelDetails,
                  newImage: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: Image.network(
                        "${Constants.imagePath}${modelDetails.posterPath}"),
                  )),
              const SizedBox(
                width: 15,
              ),
              // genres and description and rate view
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Constants.mediaQuery.height * 0.075,
                        child: GridView.builder(
                            itemCount: modelDetails.kinds!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 2.6),
                            itemBuilder: (context, index) => GenresWidget(
                                genres: modelDetails.kinds![index])),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            "${modelDetails.description}",
                            style: Constants.theme.textTheme.displaySmall
                                ?.copyWith(height: 1.3),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppThemeManager.primaryColor,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("${modelDetails.rate}")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        // More Like this section
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.only(left: 20, top: 12, bottom: 10),
          color: const Color(0xff1A1A1A),
          height: Constants.mediaQuery.height * 0.25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "More Like This",
                style: Constants.theme.textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
              FutureBuilder(
                future: ApiManager.getSimilarMovies(modelDetails.id!),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text("Something went wrong"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  var dataList = snapshot.data ?? [];
                  return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 4),
                      height: Constants.mediaQuery.height * 0.176,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: dataList.length,
                          itemBuilder: (context, index) =>
                              SimilarWidget(similarModel: dataList[index])));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
