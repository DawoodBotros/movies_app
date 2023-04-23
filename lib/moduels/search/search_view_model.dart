import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import '../../model/searchResponse.dart';
import '../../model/similarResponse.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/api_manager.dart';

class SearchViewModel extends BaseViewModel<BaseNavigator> {

  Future<SearchResponse> getMovie(String query){
    return ApiManager.getMovieSearch(movieName: query);
  }
}

abstract class SearchNavigator extends BaseNavigator {}
