import 'package:flutter/material.dart';
import 'package:movies/moduels/search/search_view_model.dart';
import '../../base.dart';
import '../../model/searchResponse.dart';
import '../../shared/styles/colors.dart';
import 'movie _items.dart';

class Searchlayout extends StatefulWidget {
  static const String routeName = "SearchView ";

  @override
  _SearchlayoutState createState() => _SearchlayoutState();
}

class _SearchlayoutState extends BaseView<Searchlayout, SearchViewModel>
    implements SearchNavigator {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBlack,
        body: Center(
            child: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: SearchView());
                },
                child: const Icon(
                  (Icons.search),
                  color: Colors.white,
                ))));
  }

  @override
  SearchViewModel initViewModel() {
    return SearchViewModel();
  }
}

class SearchView extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: Icon(
            Icons.search,
            size: 24,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.clear,
          size: 24,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SearchResponse>(
      future: SearchViewModel.getMovie(movieName: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Something Went Wrong "),
              ],
            ),
          );
        }
        var moviedata = snapshot.data?.results ?? [];
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 20),
          itemCount: moviedata.length,
          itemBuilder: (context, index) {
            return MovieItems(moviedata[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
        child: Scaffold(
      backgroundColor: colorBlack,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie,
              size: MediaQuery.of(context).size.height / 10,
              color: colorIcon,
            ),
            Text(
              "No Movies Found",
              style: TextStyle(color: colorIcon),
            ),
          ],
        ),
      ),
    ));
  }
}
