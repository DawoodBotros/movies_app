import 'package:flutter/material.dart';
import 'package:movies/moduels/home/home_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121312),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xff121312),
        selectedItemColor: Colors.yellow,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/home_icon.png')),
            label: "Home",
            backgroundColor: Color(0xff1A1A1A),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/search.png')),
            label: "Search",
            backgroundColor: Color(0xff1A1A1A),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/browse_icon.png')),
            label: "Browse",
            backgroundColor: Color(0xff1A1A1A),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/images/watch_icon.png')),
            label: "WatchList",
            backgroundColor: Color(0xff1A1A1A),
          ),
        ],
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget> tabs = [
    HomeScreen(),
  ];
}
