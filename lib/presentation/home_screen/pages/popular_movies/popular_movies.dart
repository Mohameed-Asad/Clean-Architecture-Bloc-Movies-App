import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/popular_movies_widget.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/home_screen/pages/popular_movies/view_model/states.dart';

import '../../../../domain/entities/api_caller.dart';

class PopularMovies extends StatefulWidget {
  const PopularMovies({super.key});

  @override
  State<PopularMovies> createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMovies> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Apis;
    return SafeArea(
      child: SizedBox(
          height: Constants.mediaQuery.height * 0.37,
          child: BlocBuilder<PopularViewModel, PopularStates>(
            bloc: args.popVm,
            builder: (context, state) {
              switch (state) {
                case LoadingPopularState():
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                case ErrorPopularState():
                  {
                    return const Text(
                      "Some thing wnt wrong",
                    );
                  }
                case SuccessPopularState():
                  {
                    var dataList = state.popularList;
                    return CarouselSlider.builder(
                      itemCount: dataList.length,
                      options: CarouselOptions(
                        height: Constants.mediaQuery.height * 0.37,
                        autoPlay: true,
                        autoPlayAnimationDuration: const Duration(seconds: 2),
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (context, index, realIndex) =>
                          PopularMoviesWidget(
                        popularMovies: dataList[index],
                      ),
                    );
                  }
              }
            },
          )),
    );
  }
}
