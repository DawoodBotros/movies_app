import 'package:flutter/material.dart';
import 'package:movies/model/browse_lists.dart';
import 'package:movies/moduels/search/search_view_model.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import '../../base.dart';
import '../../model/searchResponse.dart';
import '../../shared/styles/colors.dart';
import 'movie _items.dart';

class Searchlayout extends StatefulWidget {
  static const String routeName = "SearchView ";
  ResultsList? results;

  Searchlayout({this.results});

  @override
  _SearchlayoutState createState() => _SearchlayoutState();
}

class _SearchlayoutState extends BaseView<Searchlayout, SearchViewModel>
    implements SearchNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorBlack,
        body: Center(
            child: InkWell(
                onTap: () {
                  showSearch(context: context, delegate: SearchView(viewModel));
                },
                child: const Icon(
                  (Icons.search),
                  color: Colors.white,
                ))));
  }

  @override
  SearchViewModel initViewModel() {
    // TODO: implement initViewModel
    return SearchViewModel();
  }
}

class SearchView extends SearchDelegate {
  SearchViewModel viewModel;

  SearchView(this.viewModel);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(
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
      icon: const Icon(
        Icons.clear,
        size: 24,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<SearchResponse>(
      future: viewModel.getMovie(query),
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
        var movieData = snapshot.data?.results ?? [];
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 20),
          itemCount: movieData.length,
          itemBuilder: (context, index) {
            return MovieItems(movieData[index]);
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
            const Text(
              "No Movies Found",
              style: TextStyle(color: colorIcon),
            ),
          ],
        ),
      ),
    ));
  }
}
