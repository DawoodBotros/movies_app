import 'package:flutter/material.dart';
import 'package:movies/model/searchResponse.dart';
import 'package:movies/shared/styles/colors.dart';

import '../../model/popular_response.dart';
import '../../shared/constants/constants.dart';
import '../details/detailsView.dart';

class MovieItems extends StatelessWidget {
  Results results;

  MovieItems(this.results, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //going to details screen of movie
        Navigator.pushNamed(context, MovieDetailsView.routeName,
            arguments: results);
      },
      child: Container(
        color: colorBlack,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Column(
              children: [
                Image.network(
                  "$baseUrlImage${results.posterPath}",
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      results.title ?? "",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 25,
                          color: colorIcon),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${results.releaseDate}",
                      style: const TextStyle(color: colorIcon),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text("${results.voteAverage}",
                            style:
                                const TextStyle(fontSize: 16, color: colorIcon)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
