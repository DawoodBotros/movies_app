import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/SourcesTopRated.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/moduels/details/detailsView.dart';

import '../../../shared/constants/constants.dart';
import '../../../shared/styles/colors.dart';

class TopRated extends StatelessWidget {
 Results results;

  TopRated({required this.results});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // Navigator o to Details
        Navigator.pushNamed(context, MovieDetailsView.routeName,arguments: results);
      },
      child: Container(
        color: colorBlack,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colorgrey,
            ),
            width: size.width * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                              imageUrl:
                                  (BaseUrlimage + "${results.backdropPath}") ??
                                      "",
                              width: size.width * 0.3,
                              height: size.height * 0.3,
                              fit: BoxFit.fill,
                              placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator(
                                    color: Colors.yellow,
                                  )),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error)),
                          Positioned(
                              child: Stack(
                            children: [
                              Image.asset("assets/images/addToList.png"),
                              const Icon(
                                Icons.add,
                                color: Colors.white,
                              )
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: size.width * 0.015,
                      ),
                      Text(
                        "${results.voteAverage}",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Text("${results.title}",
                      style: TextStyle(color: Colors.white)),
                  Text("${results.releaseDate}",
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
