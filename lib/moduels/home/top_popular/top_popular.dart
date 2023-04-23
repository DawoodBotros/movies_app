import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/model/watch_model.dart';
import 'package:movies/moduels/details/detailsView.dart';
import 'package:movies/shared/constants/constants.dart';
import 'package:movies/shared/network/local/firebase_utils.dart';

class TopPopularScreen extends StatefulWidget {
  late WatchListModel watchListModel;
  Results resultResponse;

  TopPopularScreen({required this.resultResponse});

  @override
  State<TopPopularScreen> createState() => _TopPopularScreenState();
}

class _TopPopularScreenState extends State<TopPopularScreen> {
  var selected = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.30,
      margin: const EdgeInsets.only(bottom: 5),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.22,
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MovieDetailsView.routeName,
                        arguments: widget.resultResponse);
                  },
                  child: CachedNetworkImage(
                      imageUrl:
                          ("$BaseUrlimage${widget.resultResponse.backdropPath}") ??
                              "",
                      width: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(
                            color: Colors.yellow,
                          )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error)),
                ),
                Positioned(
                  left: size.width * 0.40,
                  top: size.height * 0.09,
                  child: const Icon(
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
                SizedBox(
                  width: size.width * 0.30,
                  height: size.height * 0.40,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                          imageUrl:
                              ("$BaseUrlimage${"${widget.resultResponse.posterPath}"}") ??
                                  "",
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.6,
                          fit: BoxFit.fitHeight,
                          placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.yellow,
                              )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error)),
                      InkWell(
                        onTap: () {
                          selected = 0;
                          if (selected == 1) {
                            addMovieToFirebase(widget.watchListModel);
                          } else {
                            deleteMovie("${widget.watchListModel.id}");
                          }
                          setState(() {});
                        },
                        child: selected == 0
                            ? Image.asset(
                                "assets/images/addToList.png",
                                color: Colors.white,
                              )
                            : Image.asset(
                                "assets/images/done.png",
                                color: Colors.yellow,
                              ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: size.width * 0.05,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    Text(
                      widget.resultResponse.title ?? "error",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                      //overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                    Text(
                      widget.resultResponse.releaseDate ?? "error",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
