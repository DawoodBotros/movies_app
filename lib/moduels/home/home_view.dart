import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/base.dart';
import 'package:movies/model/SourcesLatest.dart';
import 'package:movies/model/SourcesTopRated.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/moduels/home/home_navigator.dart';
import 'package:movies/moduels/home/home_view_model.dart';
import 'package:movies/moduels/home/latest_realeases/latesr_realeases.dart';
import 'package:movies/moduels/home/top_popular/top_popular.dart';
import 'package:movies/moduels/home/top_rated/top_rated.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<TopPopular>(
              future: HomeViewModel.getMovieDataPopular(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "error ${snapshot.error}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: const CircularProgressIndicator(
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                  );
                }
                return CarouselSlider(
                  items: snapshot.data!.results!.map((element) {
                    return TopPopularScreen(
                      resultResponse: element,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: size.height * 0.30,
                    initialPage: 0,
                    viewportFraction: 1.0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 400),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "New Releases ",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            FutureBuilder<TopPopular>(
                future: HomeViewModel.getMovieDataPopular(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        "error ${snapshot.error}",
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(
                      child: const CircularProgressIndicator(
                        color: Color.fromRGBO(255, 187, 59, 1.0),
                      ),
                    );
                  }
                  var results = snapshot.data?.results ?? [];
                  return Expanded(
                    flex: 4,
                    child: ListView.builder(
                      itemCount: results.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return LatestRealeases(results: results[index]);
                      },
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Recomended",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            FutureBuilder<SourcesTopRated>(
              future: HomeViewModel.getMovieDataTopRated(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "error ${snapshot.error}",
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(
                    child: const CircularProgressIndicator(
                      color: Color.fromRGBO(255, 187, 59, 1.0),
                    ),
                  );
                }
                var topRated = snapshot.data?.results ?? [];
                return Expanded(
                  flex: 7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topRated.length,
                    itemBuilder: (context, index) {
                      return TopRated(
                        results: topRated[index],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  HomeViewModel initViewModel() {
    return HomeViewModel();
  }
}
