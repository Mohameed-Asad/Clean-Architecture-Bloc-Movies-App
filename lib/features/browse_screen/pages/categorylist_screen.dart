import 'package:flutter/material.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/features/browse_screen/widgets/movies_in_category_widget.dart';

import '../../../core/config/Constants.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var genresId = ModalRoute.of(context)?.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Movies related to this section",
          style: Constants.theme.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: ApiManager.getCategoriesList("$genresId"),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          var dataList = snapshot.data ?? [];
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            itemCount: dataList.length,
            itemBuilder: (context, index) =>
                MoviesInCategory(searchModel: dataList[index]),
          );
        },
      ),
    );
  }
}
