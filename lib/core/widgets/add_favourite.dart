import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  final Widget newImage;

  const FavoriteWidget({super.key, required this.newImage});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            child: widget.newImage),
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
    );
  }
}
