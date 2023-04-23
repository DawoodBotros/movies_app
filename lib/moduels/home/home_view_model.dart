import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import 'package:movies/model/SourcesTopRated.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/shared/constants/constants.dart';

import '../../model/SourcesLatest.dart';
import '../../shared/network/remote/api_manager.dart';

class HomeViewModel extends BaseViewModel<BaseNavigator> {
  Future<SourcesTopRated> getMovieDataTopRated() {
    return ApiManager.getMovieDataTopRated();
  }

  Future<TopPopular> getMovieDataPopular() {
    return ApiManager.getMovieDataPopular();
  }
}

abstract class HomeNavigator extends BaseNavigator {}
