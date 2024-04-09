import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/domain/entities/category_model.dart';
import 'package:movies_project/main.dart';

import '../../../../core/config/route_manager/routes_names.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryWidget({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatorKey.currentState!.pushNamed(PagesRoutesName.categoryList,
            arguments:
                CategoryModel(id: categoryModel.id, name: categoryModel.name));
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
              categoryModel.name,
              style: Constants.theme.textTheme.bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}
