import 'package:flutter/material.dart';
import 'package:movies_project/core/network/api_manager.dart';
import 'package:movies_project/features/search_screen/widgets/search_movie.dart';

import '../../../core/config/Constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  OutlineInputBorder searchStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white38),
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchController.text = value;
                  });
                },
                style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xff514F4F),
                  hintText: "Search",
                  hintStyle: Constants.theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w200, color: Colors.grey),
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
                  contentPadding: const EdgeInsets.all(12),
                  enabledBorder: searchStyle,
                  focusedBorder: searchStyle,
                ),
              ),
              if (searchController.text.isEmpty)
                Column(
                  children: [
                    SizedBox(height: Constants.mediaQuery.height * 0.33),
                    Image.asset('assets/Images/search_movies_icon.png'),
                    const SizedBox(height: 10),
                    Text(
                      "No movies found",
                      style: Constants.theme.textTheme.bodyMedium
                          ?.copyWith(fontSize: 15),
                    ),
                  ],
                ),
              if (searchController.text.isNotEmpty)
                FutureBuilder(
                  future: ApiManager.searchMovies(searchController.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Something went wrong"),
                      );
                    }
                    var dataList = snapshot.data ?? [];
                    return Expanded(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 5, right: 5),
                        child: ListView.builder(
                            itemCount: dataList.length,
                            itemBuilder: (context, index) =>
                                QueryMovie(searchModel: dataList[index])),
                      ),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}
