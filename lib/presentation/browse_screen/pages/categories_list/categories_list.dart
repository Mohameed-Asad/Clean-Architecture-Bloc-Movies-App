import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/presentation/browse_screen/pages/categories_list/view_model/cubit.dart';
import 'package:movies_project/presentation/browse_screen/pages/categories_list/view_model/states.dart';

import '../../../../core/config/Constants.dart';
import 'category_widget.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  var vm = CategoryListViewModel();

  @override
  void initState() {
    vm.getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Categories List",
          style: Constants.theme.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<CategoryListViewModel, CategoryListStates>(
        bloc: vm,
        builder: (context, state) {
          switch (state) {
            case LoadingCategoryListState():
              {
                return const Center(child: CircularProgressIndicator());
              }
            case ErrorCategoryListState():
              {
                return const Text(
                  "Some thing went wrong",
                );
              }
            case SuccessCategoryListState():
              {
                var dataList = state.categoryList;
                return GridView.builder(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 17),
                    itemCount: dataList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4 / 3,
                    ),
                    itemBuilder: (context, index) => CategoryWidget(
                          categoryModel: dataList[index],
                        ));
              }
          }
        },
      ),
    );
  }
}
