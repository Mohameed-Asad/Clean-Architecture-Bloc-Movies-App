import 'package:flutter/material.dart';
import 'package:movies_project/core/config/Constants.dart';
import 'package:movies_project/core/network/firebase_utils.dart';
import 'package:movies_project/features/watchlist_screen/widgets/watchlist_widget.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

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
      body: StreamBuilder(
        stream: FirebaseUtils().getStreamData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          }
          var dataList =
              snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
          if (dataList.isNotEmpty) {
            return Container(
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) =>
                    WatchList(model: dataList[index]),
              ),
            );
          } else {
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
          }
        },
      ),
    );
  }
}
