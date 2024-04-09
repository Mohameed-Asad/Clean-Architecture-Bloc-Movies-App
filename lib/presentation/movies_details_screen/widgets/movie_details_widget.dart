import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/widgets/add_favourite/view_model/cubit.dart';
import 'package:movies_project/domain/entities/details_model.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/view_model_similar/cubit_similar.dart';
import 'package:movies_project/presentation/movies_details_screen/view_model/view_model_similar/states_similar.dart';
import 'package:movies_project/presentation/movies_details_screen/widgets/similar_widget.dart';

import 'genres_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final DetailsModel modelDetails;

  const MovieDetailsWidget({super.key, required this.modelDetails});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  var vm = SimilarViewModel();
  var vm2 = FavouriteViewModel();
  bool isClicked = false;

  @override
  void initState() {
    vm.getSimilarMovies(widget.modelDetails.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            height: 235,
            color: Colors.transparent,
            child: Image.network(
              "${Constants.imagePath}${widget.modelDetails.backPath}",
              fit: BoxFit.cover,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            widget.modelDetails.title,
            style: Constants.theme.textTheme.bodyLarge?.copyWith(height: 1.1),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 20),
          child: Text(
            widget.modelDetails.releaseDate,
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
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    child: Image.network(
                        "${Constants.imagePath}${widget.modelDetails.posterPath}"),
                  ),
                  if (isClicked)
                    Image.asset("assets/Images/awesome-bookmark.png"),
                  if (isClicked)
                    Positioned(
                        top: -10,
                        left: -11,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          icon: const Icon(
                            Icons.check_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  if (!isClicked) Image.asset("assets/Images/favorite.png"),
                  if (!isClicked)
                    Positioned(
                        top: -10,
                        left: -11,
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                ],
              ),

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
                            itemCount: widget.modelDetails.kinds.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 2.6),
                            itemBuilder: (context, index) => GenresWidget(
                                genres: widget.modelDetails.kinds[index])),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            widget.modelDetails.description,
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
                          Text("${widget.modelDetails.rate}")
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
              BlocBuilder<SimilarViewModel, SimilarStates>(
                bloc: vm,
                builder: (context, state) {
                  switch (state) {
                    case LoadingSimilarState():
                      {
                        return const Center(child: CircularProgressIndicator());
                      }
                    case ErrorSimilarState():
                      {
                        return const Text(
                          "Some thing went wrong",
                        );
                      }
                    case SuccessSimilarState():
                      {
                        var dataList = state.similarList;
                        if (dataList.isEmpty) {
                          return SizedBox(
                              width: Constants.mediaQuery.width,
                              height: Constants.mediaQuery.height * 0.176,
                              child: const Center(
                                  child: Text("No Similar Movies Available!")));
                        } else {
                          return Container(
                              margin: const EdgeInsets.only(top: 10, bottom: 4),
                              height: Constants.mediaQuery.height * 0.176,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) =>
                                      SimilarWidget(
                                          similarModel: dataList[index])));
                        }
                      }
                  }
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
