import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/layout/home_layout.dart';
import 'package:movies/moduels/browse/browse_screen/browse_list.dart';
import 'package:movies/moduels/details/detailsView.dart';
import 'package:movies/moduels/search/searchView.dart';
import 'package:movies/moduels/splash/splash_screen.dart';
import 'package:movies/moduels/watch/watch_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeLayout.routeName,
      routes: {
        //   SplashScreen.routeName :(context) => SplashScreen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        MovieDetailsView.routeName: (context) => MovieDetailsView(),
        Searchlayout.routeName: (context) => Searchlayout(),
        BrowseList.routeName: (context) => BrowseList(),
        WatchScreen.routeName: (context) => WatchScreen(),
      },
    );
  }
}
