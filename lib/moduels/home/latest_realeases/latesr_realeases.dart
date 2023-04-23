import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/SourcesLatest.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/moduels/home/home_view.dart';
import 'package:movies/shared/styles/colors.dart';

import '../../../shared/constants/constants.dart';

class LatestRealeases extends StatelessWidget {
  Results results;

  LatestRealeases({required this.results});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 180,
      color: colorgrey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Stack(
                alignment: Alignment.topLeft,
                children: [
                  CachedNetworkImage(
                    imageUrl: (BaseUrlimage + "${results.posterPath}"),
                    width: size.width * 0.3,
                    height: size.height * 0.3,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                      child: Stack(
                    alignment: Alignment.topLeft,
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
            )
          ],
        ),
      ),
    );
  }
}
