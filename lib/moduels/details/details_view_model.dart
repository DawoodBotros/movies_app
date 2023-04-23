import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies/base.dart';
import '../../model/searchResponse.dart';
import '../../model/similarResponse.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/api_manager.dart';

class DetailsViewModel extends BaseViewModel<BaseNavigator> {
  Future<SimilarResponse> getSimilar(String movieID) {
    return ApiManager.getSimilar(movieID: movieID);
  }
}

abstract class DetailsNavigator extends BaseNavigator {}
