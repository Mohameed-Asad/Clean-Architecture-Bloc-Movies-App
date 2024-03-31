import 'package:flutter/material.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/features/browse_screen/widgets/category_widget.dart';

import '../../../core/config/Constants.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

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
      body: FutureBuilder(
          future: ApiManager.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            }
            var dataList = snapshot.data ?? [];
            return GridView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 17),
                itemCount: dataList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 3,
                ),
                itemBuilder: (context, index) => CategoryWidget(
                      genresModel: dataList[index],
                    ));
          }),
    );
  }
}
