import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/layout/home_layout.dart';
import 'package:movies/moduels/details/detailsView.dart';
import 'package:movies/moduels/search/SearchView.dart';
import 'package:movies/moduels/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
       return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          routes: {
            SplashScreen.routeName :(context) => SplashScreen(),
            HomeLayout.routeName: (context) => HomeLayout(),
            MovieDetailsView.routeName :(context) =>MovieDetailsView(),
            Searchlayout.routeName : (context) => Searchlayout(),
          },
        );
      },
    );
  }
}
