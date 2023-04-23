import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:movies/model/watch_model.dart';

CollectionReference<WatchListModel> getMovieWatch() {
  return FirebaseFirestore.instance
      .collection("movies")
      .withConverter<WatchListModel>(
        fromFirestore: (snapshot, options) =>
            WatchListModel.fromJson(snapshot.data()),
        toFirestore: (value, options) => value.toJson(),
      );
}

Future<void> addMovieToFirebase(WatchListModel watchList) {
  var collection = getMovieWatch();
  var def = collection.doc();
  watchList.id = def.id;
  return def.set(watchList);
}

Stream<QuerySnapshot<WatchListModel>> getMovie() {
  CollectionReference<WatchListModel> coll = getMovieWatch();
  return coll.snapshots();
}
 Future<QuerySnapshot<WatchListModel>> readMovieFormFirebase(String id) async {
var mov =  await getMovieWatch().where('id',isEqualTo: id).get();
return mov;
}

Future<void> deleteMovie(String id) {
  return getMovieWatch().doc(id).delete();
}
