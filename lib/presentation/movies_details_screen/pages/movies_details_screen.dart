import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/domain/entities/all_movies_model.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/cubit.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/states.dart';

import '../widgets/movie_details_widget.dart';

class MoviesDetails extends StatefulWidget {
  final AllMoviesModel model;

  const MoviesDetails({super.key, required this.model});

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  var vm = DetailsViewModel();

  @override
  void initState() {
    vm.getMovieDetails(widget.model.id ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.model.title ?? ""),
          ),
          body: BlocBuilder<DetailsViewModel, DetailsStates>(
            bloc: vm,
            builder: (context, state) {
              switch (state) {
                case LoadingDetailsStates():
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                case ErrorDetailsStates():
                  {
                    return const Text(
                      "Some thing went wrong",
                    );
                  }
                case SuccessDetailsStates():
                  {
                    var model = state.detailsModel;
                    return MovieDetailsWidget(modelDetails: model);
                  }
              }
            },
          )),
    );
  }
}
