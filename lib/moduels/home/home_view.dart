import 'package:flutter/material.dart';
import 'package:movies/model/top_popular.dart';
import 'package:movies/moduels/home/home_view_model.dart';
import 'package:movies/moduels/home/top_popular/top_populars.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        FutureBuilder<TopPopular>(
          future: HomeViewModel.getMovieDataPopular(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: Text(
                  "error ${snapshot.error}",
                  style: TextStyle(color: Colors.white),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: const CircularProgressIndicator(
                  color: Color.fromRGBO(255, 187, 59, 1.0),
                ),
              );
            }
            return TopPopularScreen();
          },
        ),
      ],
    );
  }
}
