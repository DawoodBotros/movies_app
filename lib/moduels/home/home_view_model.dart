import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import 'package:movies/model/SourcesTopRated.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/shared/constants/constants.dart';

import '../../model/SourcesLatest.dart';

class HomeViewModel extends BaseViewModel<BaseNavigator> {
  static Future<TopPopular> getMovieDataPopular() async {
    var response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=7aa670a039049fe47b8c7fc56d2bf588&language=en-US&page=1'),
    );
    try {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      print(json.hashCode);
      TopPopular popular = TopPopular.fromJson(json);
      print(popular.results);
      return popular;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<SourcesLatest> getMovieDataLatest() async {
    Uri URL = Uri.https(BASE, '/3/movie/latest', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      print(response);
      var json = jsonDecode(response.body);
      print(json);
      SourcesLatest sourcesLatest = SourcesLatest.fromJson(json);
      print(sourcesLatest);
      return sourcesLatest;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  static Future<SourcesTopRated> getMovieDataTopRated() async {
    Uri URL = Uri.https(BASE, '/3/movie/top_rated', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      print(response);
      var json = jsonDecode(response.body);
      print(json);
      SourcesTopRated sourcesTopRated = SourcesTopRated.fromJson(json);
      print(sourcesTopRated);
      return sourcesTopRated;
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
