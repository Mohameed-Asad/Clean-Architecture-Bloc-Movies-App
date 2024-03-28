import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/features/home_screen/widgets/release_movies_widget.dart';

import '../../../core/models/api_models.dart';

class ReleaseMovies extends StatelessWidget {
  const ReleaseMovies({super.key});

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
          "New Release",
          style: Constants.theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        FutureBuilder(
          future: args.releaseApi,
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
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dataList.length,
                itemBuilder: (context, index) =>
                    ReleaseMoviesWidget(releaseModel: dataList[index]),
              ),
            );
          },
        ),
      ]),
    );
  }
}
