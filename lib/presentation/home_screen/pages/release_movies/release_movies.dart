import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/release_movies_widget.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/home_screen/pages/release_movies/view_model/states.dart';

import '../../../../domain/entities/api_caller.dart';

class ReleaseMovies extends StatefulWidget {
  const ReleaseMovies({super.key});

  @override
  State<ReleaseMovies> createState() => _ReleaseMoviesState();
}

class _ReleaseMoviesState extends State<ReleaseMovies> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Apis;
    return Container(
      padding: const EdgeInsets.only(left: 17, top: 12, bottom: 3),
      color: const Color(0xff1A1A1A),
      width: Constants.mediaQuery.width,
      height: Constants.mediaQuery.height * 0.23,
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(
          "New Release",
          style: Constants.theme.textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
        BlocBuilder<ReleaseViewModel, ReleaseStates>(
          bloc: args.relVm,
          builder: (context, state) {
            switch (state) {
              case LoadingReleaseStates():
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case ErrorReleaseStates():
                {
                  return const Text(
                    "Some thing wnt wrong",
                  );
                }
              case SuccessReleaseStates():
                {
                  var dataList = state.releaseList;
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: dataList.length,
                      itemBuilder: (context, index) =>
                          ReleaseMoviesWidget(releaseModel: dataList[index]),
                    ),
                  );
                }
            }
          },
        )
      ]),
    );
  }
}
