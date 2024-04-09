import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/recommended_movies_widget.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/home_screen/pages/recommended_movies/view_model/states.dart';

import '../../../../core/config/Constants.dart';
import '../../../../domain/entities/api_caller.dart';

class RecommendedMovies extends StatefulWidget {
  const RecommendedMovies({super.key});

  @override
  State<RecommendedMovies> createState() => _RecommendedMoviesState();
}

class _RecommendedMoviesState extends State<RecommendedMovies> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Apis;
    return Container(
      padding: const EdgeInsets.only(left: 17, top: 12),
      color: const Color(0xff1A1A1A),
      width: Constants.mediaQuery.width,
      height: Constants.mediaQuery.height * 0.23,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "Recommended",
          style: Constants.theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        BlocBuilder<RecommendedViewModel, RecommendedStates>(
          bloc: args.recVm,
          builder: (context, state) {
            switch (state) {
              case LoadingRecommendedState():
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case ErrorRecommendedState():
                {
                  return const Text(
                    "Some thing wnt wrong",
                  );
                }
              case SuccessRecommendedState():
                {
                  var dataList = state.recommendedList;
                  return Container(
                    margin: const EdgeInsets.only(top: 7, bottom: 4),
                    height: Constants.mediaQuery.height * 0.166,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: dataList.length,
                        itemBuilder: (context, index) =>
                            RecommendedMoviesWidget(
                              recommendedModel: dataList[index],
                            )),
                  );
                }
            }
          },
        )
      ]),
    );
  }
}
