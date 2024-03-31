import 'package:flutter/material.dart';
import 'package:movies_project/core/models/allmovies_model.dart';
import 'package:movies_project/core/network/firebase_utils.dart';

class FavoriteWidget extends StatefulWidget {
  final Widget newImage;
  final AllMoviesModel favModel;

  const FavoriteWidget({
    super.key,
    required this.newImage,
    required this.favModel,
  });

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    if (!isClicked) {
      return Stack(
        children: [
          widget.newImage,
          Image.asset("assets/Images/favorite.png"),
          Positioned(
              top: -10,
              left: -11,
              child: IconButton(
                onPressed: () {
                  FirebaseUtils().addToFavourite(widget.favModel);
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
      );
    } else {
      return Stack(
        children: [
          widget.newImage,
          Image.asset("assets/Images/awesome-bookmark.png"),
          Positioned(
              top: -10,
              left: -11,
              child: IconButton(
                onPressed: () {
                  FirebaseUtils().removeFav(widget.favModel);
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
      );
    }
  }
}
