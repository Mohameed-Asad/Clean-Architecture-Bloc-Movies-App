import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/config/app_theme_manager.dart';
import 'package:movies_project/core/models/release_model.dart';

class ReleaseMoviesWidget extends StatelessWidget {
  final ReleaseModel releaseModel;

  const ReleaseMoviesWidget({super.key, required this.releaseModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeManager.secondaryColor,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                NetworkImage("${Constants.imagePath}${releaseModel.posterPath}"),
          ),
        ),
        child: Stack(
          children: [
            Image.asset("assets/Images/favorite.png"),
            Icon(Icons.add)
          ],
        )
      ),
    );
  }
}
