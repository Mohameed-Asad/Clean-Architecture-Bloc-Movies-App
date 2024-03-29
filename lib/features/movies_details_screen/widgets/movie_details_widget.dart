import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/models/model_details.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/features/movies_details_screen/widgets/genres_widget.dart';
import 'package:movies_project/features/movies_details_screen/widgets/similar_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final ModelDetails modelDetails;

  const MovieDetailsWidget({super.key, required this.modelDetails});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.network("${Constants.imagePath}${widget.modelDetails.backPath}"),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Text(
            "${widget.modelDetails.title}",
            style: Constants.theme.textTheme.bodyLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3, left: 20),
          child: Text(
            "${widget.modelDetails.releaseDate}",
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
                  Image.network(
                    "${Constants.imagePath}${widget.modelDetails.posterPath}",
                  ),
                  if (!isClicked)
                    Image.asset(
                      "assets/Images/favorite.png",
                    ),
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
                  if (isClicked) Image.asset("assets/Images/bookmark.png"),
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
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              // genres and description and rate view
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Constants.mediaQuery.height * 0.077,
                        child: GridView.builder(
                            itemCount: widget.modelDetails.kinds!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5,
                                    childAspectRatio: 2.6),
                            itemBuilder: (context, index) => GenresWidget(
                                genres: widget.modelDetails.kinds![index])),
                      ),
                      Expanded(
                        child: Text(
                          "${widget.modelDetails.description}",
                          style: Constants.theme.textTheme.displaySmall
                              ?.copyWith(height: 1.4),
                        ),
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
          width: Constants.mediaQuery.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "More Like This",
                style: Constants.theme.textTheme.bodyMedium,
                textAlign: TextAlign.start,
              ),
              FutureBuilder(
                future: ApiManager.getSimilarMovies(widget.modelDetails.id!),
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
                          itemBuilder: (context, index) => SimilarWidget(
                              recommendedModel: dataList[index])));
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
