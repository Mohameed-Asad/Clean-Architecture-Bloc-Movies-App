import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/domain/entities/category_model.dart';
import 'package:movies_project/presentation/browse_screen/pages/category_movies/view_model/cubit.dart';
import 'package:movies_project/presentation/browse_screen/pages/category_movies/view_model/states.dart';

import '../../../../core/config/Constants.dart';
import 'movies_in_category_widget.dart';

class CategoryListScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryListScreen({super.key, required this.categoryModel});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  var vm = CategoryMoviesViewModel();

  @override
  void initState() {
    vm.getCategoryMovies("${widget.categoryModel.id}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Movies related to ${widget.categoryModel.name}",
            style: Constants.theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: BlocBuilder<CategoryMoviesViewModel, CategoryMoviesStates>(
          bloc: vm,
          builder: (context, state) {
            switch (state) {
              case LoadingMoviesStates():
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case ErrorMoviesStates():
                {
                  return const Text(
                    "Some thing went wrong",
                  );
                }
              case SuccessMoviesStates():
                {
                  var dataList = state.categoryMovies;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    itemCount: dataList.length,
                    itemBuilder: (context, index) =>
                        MoviesInCategory(sectionModel: dataList[index]),
                  );
                }
            }
          },
        ));
  }
}
