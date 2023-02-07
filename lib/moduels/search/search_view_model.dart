import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import '../../model/searchResponse.dart';
import '../../model/similarResponse.dart';
import '../../shared/constants/constants.dart';

class SearchViewModel extends BaseViewModel<BaseNavigator> {
  static Future<SearchResponse> getMovie({String? movieName}) async {
    try {
      Uri url = Uri.https(BASE, '/3/search/movie', {
        "api_key": APIKEY,
        "query": movieName,
      });
      Response movieSearch = await http.get(url);
      var json = jsonDecode(movieSearch.body);
      SearchResponse searchResponse = SearchResponse.fromJson(json);
      return searchResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

abstract class SearchNavigator extends BaseNavigator {}
