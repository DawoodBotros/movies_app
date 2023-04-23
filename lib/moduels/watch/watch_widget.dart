import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/shared/network/local/firebase_utils.dart';

import '../../model/watch_model.dart';
import '../../shared/constants/constants.dart';

class WatchWidget extends StatelessWidget {
  WatchListModel watchListModel;
  WatchWidget(this.watchListModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.topLeft,
            children: [
              CachedNetworkImage(
                  imageUrl:
                  ("$BaseUrlimage${"${watchListModel.backdropPath}"}") ??
                      "",
                  width: MediaQuery.of(context).size.width * 0.40,
                  height: MediaQuery.of(context).size.height * 0.20,
                  fit: BoxFit.fitHeight,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        color: Colors.yellow,
                      )),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error)),
              Positioned(
                child: Image.asset("assets/images/addToList.png"),
              ),
              InkWell(
                onTap: (){
                  deleteMovie("${watchListModel.id}");
                },
                  child: Icon(Icons.add))
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                "${watchListModel.title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                  maxLines: 2,
                ),
                Text(
                  "${watchListModel.releaseDate}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                  ),
                ),
                Text(
                  "${watchListModel.voteAverage}",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
