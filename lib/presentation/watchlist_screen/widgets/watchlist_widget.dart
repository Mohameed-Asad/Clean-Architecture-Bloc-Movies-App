import 'package:flutter/material.dart';
import 'package:movies_project/core/widgets/add_favourite/view_model/cubit.dart';

import '../../../core/config/Constants.dart';
import '../../../core/config/app_theme_manager.dart';
import '../../../core/config/route_manager/routes_names.dart';
import '../../../domain/entities/all_movies_model.dart';
import '../../../main.dart';

class WatchList extends StatefulWidget {
  final AllMoviesModel? model;

  const WatchList({super.key, required this.model});

  @override
  State<WatchList> createState() => _WatchListState();
}

class _WatchListState extends State<WatchList> {
  var vm = FavouriteViewModel();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pushNamed(PagesRoutesName.details,
            arguments: AllMoviesModel(
                id: widget.model!.id, title: widget.model!.title));
      },
      // child: BlocBuilder<FavouriteViewModel, FavouriteWidgetStates>(
      //     bloc: vm,
      //     builder: (context, state) {
      //       switch (state) {
      //         case AddFavouriteState():
      //           {
      child: Container(
        padding: const EdgeInsets.only(top: 3, left: 3, right: 3),
        margin: const EdgeInsets.only(bottom: 10),
        height: Constants.mediaQuery.height * 0.12,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: Constants.mediaQuery.width * 0.36,
                  child: AspectRatio(
                    aspectRatio: 1.7,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Stack(
                        children: [
                          Image.network(
                            "${Constants.imagePath}${widget.model!.backPath}",
                            fit: BoxFit.fill,
                          ),
                          Image.asset("assets/Images/awesome-bookmark.png"),
                          Positioned(
                              top: -10,
                              left: -11,
                              child: IconButton(
                                onPressed: () {
                                  vm.removeFavourite(widget.model!);
                                },
                                icon: const Icon(
                                  Icons.check_sharp,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.model!.title!,
                        style: Constants.theme.textTheme.bodySmall
                            ?.copyWith(height: 1.1),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        widget.model!.releaseDate!,
                        style: Constants.theme.textTheme.bodySmall
                            ?.copyWith(color: Colors.grey, fontSize: 10),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: AppThemeManager.primaryColor,
                            size: 15,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "${widget.model!.rate}",
                            style:
                                Constants.theme.textTheme.bodySmall?.copyWith(
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              color: Colors.grey,
              height: 1,
              thickness: 1.3,
            )
          ],
          // );
          // }
          // case RemoveFavouriteState():
          //   {
          //     return Text("");
          //   }
        ),
      ),
    );
  }
}
