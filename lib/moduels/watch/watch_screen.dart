import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/moduels/watch/watch_widget.dart';
import 'package:movies/shared/network/local/firebase_utils.dart';
import 'package:movies/shared/network/remote/api_manager.dart';

import '../../model/watch_model.dart';

class WatchScreen extends StatefulWidget {
  static const String routeName = "watch";
  WatchListModel watchListModel = WatchListModel();
  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "WatchList",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: StreamBuilder <QuerySnapshot<WatchListModel>>(
                  stream: getMovie(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          "error ${snapshot.error}",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    } else if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Color.fromRGBO(255, 187, 59, 1.0),
                        ),
                      );
                    }
                    var movie = snapshot.data?.docs.map((movie) => movie.data()).toList() ??[];
                    return ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.grey,
                          thickness: 1,
                        ), itemCount: movie.length,
                      itemBuilder: (context, index) {
                        return WatchWidget(movie[index]);
                      },
                    );
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }

}
