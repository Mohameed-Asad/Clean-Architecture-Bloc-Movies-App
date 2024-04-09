import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/presentation/watchlist_screen/view_model/cubit.dart';
import 'package:movies_project/presentation/watchlist_screen/view_model/states.dart';

import '../widgets/watchlist_widget.dart';

class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  var vm = WatchListViewModel();

  @override
  void initState() {
    vm.getWatchListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourite List",
          style: Constants.theme.textTheme.bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<WatchListViewModel, WatchListStates>(
          bloc: vm,
          builder: (context, state) {
            switch (state) {
              case LoadingWatchList():
                {
                  return const Center(child: CircularProgressIndicator());
                }
              case ErrorWatchList():
                {
                  return const Text(
                    "Some thing went wrong",
                  );
                }

              case SuccessGetWatchList():
                {
                  var dataList = state.watchList;
                  if (dataList.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/Images/search_movies_icon.png'),
                          const SizedBox(height: 15),
                          const Text("No Movies added yet"),
                        ],
                      ),
                    );
                  } else {
                    return Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(10),
                      child: ListView.builder(
                        itemCount: dataList.length,
                        itemBuilder: (context, index) =>
                            WatchList(model: dataList[index]),
                      ),
                    );
                  }
                }
            }
          }),
    );
  }
}
