import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/features/home_screen/widgets/popluar_movies_widget.dart';

import '../../../core/network/api_manager.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: ApiManager.getPopularMovies(),
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
          return CarouselSlider.builder(
                itemCount: dataList.length,
                options: CarouselOptions(
                  height: Constants.mediaQuery.height * 0.35,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                ),
                itemBuilder: (context, index, realIndex) => PopularMoviesWidget(
                  popularMovies: dataList[index],
                ),
          );
        },
      ),
    );
  }
}
