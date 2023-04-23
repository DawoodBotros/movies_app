import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/shared/styles/colors.dart';
import '../../model/popular_response.dart';
import '../../shared/constants/constants.dart';
import 'detailsView.dart';

class SimilarItems extends StatelessWidget {
  Results similar;

  SimilarItems(this.similar);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailsView.routeName,
            arguments: similar);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.32,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color: colorgrey, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    CachedNetworkImage(
                        imageUrl: ("$BaseUrlimage${similar.backdropPath}") ?? "",
                        width: size.width * 0.3,
                        height: size.height * 0.3,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                                color: Colors.yellow,
                              ),
                            ),
                        errorWidget: (context, url, error) => Icon(Icons.error)),
                    Positioned(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/addToList.png"),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
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
                  "${similar.voteAverage}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Text("${similar.title}", style: TextStyle(color: Colors.white)),
            Text("${similar.releaseDate}", style: TextStyle(color: Colors.white)),
          ]),
        ),
      ),
    );
  }
}
