import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/model/top_popular.dart';
import 'package:movies/shared/constants/constants.dart';

class TopPopularScreen extends StatelessWidget {
  Results? resultResponse;

  TopPopularScreen({this.resultResponse});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      margin: EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                CachedNetworkImage(
                    imageUrl: resultResponse?.posterPath ?? "",
                    placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(
                          color: Colors.yellow,
                        )),
                    errorWidget: (context, url, error) => Icon(Icons.error)),
                Positioned(
                  left: size.width * 0.40,
                  top: size.height * 0.09,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 70,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.06,
            child: Row(
              children: [
                Container(
                  width: 130,
                  height: 300,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl: resultResponse?.posterPath ?? "",
                          placeholder: (context, url) => Center(
                              child: CircularProgressIndicator(
                                color: Colors.yellow,
                              )),
                          errorWidget: (context, url, error) => Icon(Icons.error)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      resultResponse?.title ?? "error",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      //overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                    Text(
                      resultResponse?.releaseDate ?? "error",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}
