import 'package:flutter/material.dart';
import 'package:movies/model/browse_lists.dart';
import 'package:movies/moduels/details/detailsView.dart';
import 'package:movies/shared/constants/constants.dart';

import '../../model/popular_response.dart';

class FilteredMovie extends StatelessWidget {

  Results results;

  FilteredMovie({required this.results, });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(MovieDetailsView.routeName, arguments: results);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                BaseUrlimage +
                    ((results.backdropPath) ??
                        '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg'),
                height: size.height * 0.15,
                width: size.width * 0.5,
                fit: BoxFit.fitHeight,
              ),
            ),
            Container(
              width: size.width * 0.3,
              child: Text(
                results.title ?? 'film',
                style: const TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset("assets/images/flim-play.png",)
          ],
        ),
      ),
    );
  }
}
