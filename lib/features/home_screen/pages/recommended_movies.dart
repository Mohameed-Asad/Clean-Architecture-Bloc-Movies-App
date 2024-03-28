import 'package:flutter/material.dart';
import 'package:movies_project/features/home_screen/widgets/recommended_movies_widget.dart';

import '../../../core/config/Constants.dart';
import '../../../core/models/api_models.dart';

class RecommendedMovies extends StatelessWidget {
  const RecommendedMovies({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as ApisCaller;
    return Container(
      padding: const EdgeInsets.only(left: 17, top: 17),
      color: const Color(0xff1A1A1A),
      width: Constants.mediaQuery.width,
      height: Constants.mediaQuery.height * 0.23,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "Recommended",
          style: Constants.theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        FutureBuilder(
          future: args.recommendedApi,
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
              height: Constants.mediaQuery.height * 0.155,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dataList.length,
                  itemBuilder: (context, index) => RecommendedMoviesWidget(
                    recommendedModel: dataList[index],
                  )),
            );
          },
        ),
      ]),
    );
  }
}
