import 'package:flutter/material.dart';
import 'package:movies/base.dart';
import 'package:movies/model/Geners.dart';
import 'package:movies/model/browse_lists.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/moduels/browse/browse_screen/browse_view_model.dart';
import 'package:movies/moduels/browse/filtred.dart';
import 'package:movies/moduels/search/searchView.dart';
import 'package:movies/shared/styles/colors.dart';

import '../../../shared/network/remote/api_manager.dart';

class BrowseList extends StatefulWidget {
  static const String routeName = 'Browse Results';

  @override
  _BrowseListState createState() => _BrowseListState();
}

class _BrowseListState extends BaseView<BrowseList,BrowseViewModel> implements BrowseNavigator{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator =this;
  }
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as Genres;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorgrey,
        title: Text(
          '${args.name}',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      backgroundColor: colorBlack,
      body: Column(
        children: [
          FutureBuilder<TopPopular>(
            future: viewModel.getMovieDataList("${args.id}"),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                    ),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color.fromRGBO(255, 187, 59, 1.0),
                  ),
                );
              }
              var lists = snapshot.data!.results ?? [];
              return Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ),
                    itemCount: lists.length,
                    itemBuilder: (context, index) => FilteredMovie(
                          results: lists[index],
                        )),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  BrowseViewModel initViewModel() {
    return BrowseViewModel();
  }
}
