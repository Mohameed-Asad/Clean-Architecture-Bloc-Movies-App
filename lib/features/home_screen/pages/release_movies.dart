import 'package:flutter/material.dart';
import 'package:movies_project/features/home_screen/widgets/release_movies.dart';

import '../../../core/network/api_manager.dart';

class ReleaseMovies extends StatelessWidget {
  const ReleaseMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getReleaseMovies(),
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
    );
  }
}
