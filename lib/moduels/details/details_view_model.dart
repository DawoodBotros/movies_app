import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import '../../model/searchResponse.dart';
import '../../model/similarResponse.dart';
import '../../shared/constants/constants.dart';

class DetailsViewModel extends BaseViewModel<BaseNavigator> {
  static Future<SimilarResponse> getSimilar({required String? movieID}) async {
    try {
      //https://api.themoviedb.org/3/movie/{movie_id}/similar?api_key=6e47b8fd3d3192ba9120b08bd814b75d
      Uri url = Uri.https(BASE, '/3/movie/$movieID/similar', {
        "api_key": APIKEY,
        "movie_id": "movieID",
      });

      Response similarMovie = await http.get(url);

      var json = jsonDecode(similarMovie.body);
      print(json);
      SimilarResponse similarResponse = SimilarResponse.fromJson(json);

      return similarResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

abstract class DetailsNavigator extends BaseNavigator {}
