import 'package:flutter/material.dart';
import 'package:movies/base.dart';
import 'package:movies/model/searchResponse.dart';
import 'package:movies/moduels/details/details_view_model.dart';
import 'package:movies/moduels/details/similarItems.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import 'package:movies/shared/styles/colors.dart';
import 'package:provider/provider.dart';
import '../../model/popular_response.dart';
import '../../model/similarResponse.dart';
import '../../shared/constants/constants.dart';

class MovieDetailsView extends StatefulWidget {
  static const String routeName = "MovieDetailsView";

  const MovieDetailsView({super.key});

  @override
  _MovieDetailsViewState createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState
    extends BaseView<MovieDetailsView, DetailsViewModel>
    implements DetailsNavigator {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  Widget build(BuildContext context) {
    var movieID = ModalRoute.of(context)!.settings.arguments as Results;
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        title: Text(movieID.title ?? "",
            style: const TextStyle(color: yellowColor, fontSize: 22)),
        centerTitle: true,
        backgroundColor: colorBlack,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                "$BaseUrlimage${movieID.backdropPath}",
                height: 180,
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            "$BaseUrlimage${movieID.posterPath}",
                            height: MediaQuery.of(context).size.height / 4,
                            fit: BoxFit.fill,
                          ),
                          InkWell(
                            onTap: () {
                              //Add MOVIE TO WATCH LIST
                            },
                            child: Image.asset("assets/images/addToList.png"),
                          ),
                          const Icon(
                            Icons.add,
                            color: colorIcon,
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          style: const TextStyle(color: colorIcon),
                          movieID.overview ?? "",
                          maxLines: 5,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${movieID.voteAverage}",
                              style: const TextStyle(color: colorIcon),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              const Text(
                "More Like This",
                style: TextStyle(color: yellowColor, fontSize: 18),
              ),
              Container(
                color: colorgrey,
                height: MediaQuery.of(context).size.width / 1.5,
                child: FutureBuilder<SimilarResponse>(
                  future: viewModel.getSimilar(movieID.id.toString()),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "Something Went Wrong",
                              style: TextStyle(color: colorIcon),
                            ),
                          ],
                        ),
                      );
                    }
                    var similarData = snapshot.data?.results ?? [];

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      itemCount: similarData.length,
                      itemBuilder: (context, index) {
                        return SimilarItems(similarData[index]);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel initViewModel() {
    return DetailsViewModel();
  }
}
