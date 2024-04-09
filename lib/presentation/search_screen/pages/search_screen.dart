import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/presentation/search_screen/view_model/cubit.dart';
import 'package:movies_project/presentation/search_screen/view_model/states.dart';

import '../../../core/config/Constants.dart';
import '../widgets/search_movie.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    super.key,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var vm = SearchViewModel();
  TextEditingController searchController = TextEditingController();
  OutlineInputBorder searchStyle = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white38),
    borderRadius: BorderRadius.all(
      Radius.circular(25),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(children: [
            TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchController.text = value;
                  vm.getSearchList(searchController.text);
                });
              },
              style: Constants.theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w100,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xff514F4F),
                hintText: "Search",
                hintStyle: Constants.theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w200, color: Colors.grey),
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
              BlocBuilder<SearchViewModel, SearchStates>(
                  bloc: vm,
                  builder: (context, state) {
                    switch (state) {
                      case LoadingSearchState():
                        {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      case ErrorSearchState():
                        {
                          return const Text(
                            "Some thing went wrong",
                          );
                        }
                      case SuccessSearchState():
                        {
                          var dataList = state.searchList;
                          return Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 20, left: 5, right: 5),
                              child: ListView.builder(
                                  itemCount: dataList.length,
                                  itemBuilder: (context, index) =>
                                      QueryMovie(searchModel: dataList[index])),
                            ),
                          );
                        }
                    }
                  })
          ]),
        ),
      ),
    );
  }
}
