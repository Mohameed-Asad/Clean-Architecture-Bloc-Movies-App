import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/release_model.dart';

class ReleaseMoviesWidget extends StatefulWidget {
  final ReleaseModel releaseModel;

  const ReleaseMoviesWidget({super.key, required this.releaseModel});

  @override
  State<ReleaseMoviesWidget> createState() => _ReleaseMoviesWidgetState();
}

class _ReleaseMoviesWidgetState extends State<ReleaseMoviesWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 13, right: 15),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
                "${Constants.imagePath}${widget.releaseModel.posterPath}"),
          ),
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
    );
  }
}
