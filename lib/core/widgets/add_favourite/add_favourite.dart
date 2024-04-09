import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/widgets/add_favourite/view_model/cubit.dart';
import 'package:movies_project/core/widgets/add_favourite/view_model/states.dart';

import '../../../domain/entities/all_movies_model.dart';

class FavoriteWidget extends StatefulWidget {
  final Widget newImage;
  final AllMoviesModel favModel;

  const FavoriteWidget(
      {super.key, required this.newImage, required this.favModel});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  var vm = FavouriteViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteViewModel, FavouriteWidgetStates>(
        bloc: vm,
        builder: (context, state) {
          switch (state) {
            case AddFavouriteState():
              {
                return Stack(
                  children: [
                    widget.newImage,
                    Image.asset("assets/Images/awesome-bookmark.png"),
                    Positioned(
                        top: -10,
                        left: -11,
                        child: IconButton(
                          onPressed: () {
                            vm.removeFavourite(widget.favModel);
                          },
                          icon: const Icon(
                            Icons.check_sharp,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  ],
                );
              }
            case RemoveFavouriteState():
              {
                return Stack(
                  children: [
                    widget.newImage,
                    Image.asset("assets/Images/favorite.png"),
                    Positioned(
                        top: -10,
                        left: -11,
                        child: IconButton(
                          onPressed: () {
                            vm.addFavourite(widget.favModel);
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  ],
                );
              }
          }
        });
  }
}
