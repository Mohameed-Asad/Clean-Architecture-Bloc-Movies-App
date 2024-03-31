import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/models/genres_model.dart';
import 'package:movies_project/core/route_manager/routes_names.dart';
import 'package:movies_project/main.dart';

class CategoryWidget extends StatelessWidget {
  final GenresModel genresModel;

  const CategoryWidget({super.key, required this.genresModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!
            .pushNamed(PagesRoutesName.categoryList, arguments: genresModel.id);
      },
      child: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Images/Netflix_logo.png"),
              fit: BoxFit.cover,
              opacity: 0.4,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Text(
              genresModel.name!,
              style: Constants.theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
