import 'package:flutter/material.dart';
import 'package:movies_project/presentation/search_screen/pages/search_screen.dart';
import 'package:movies_project/presentation/watchlist_screen/pages/watchlist_screen.dart';

import 'browse_screen/pages/categories_list/categories_list.dart';
import 'home_screen/pages/home_screen.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int currentIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const BrowseScreen(),
    const WatchListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/bottom_icons/home_icon.png'),
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom_icons/search_icon.png'),
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom_icons/browse_icon.png'),
                ),
                label: "Browse"),
            BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage('assets/bottom_icons/list_icon.png'),
                ),
                label: "WatchList"),
          ]),
    );
  }
}
