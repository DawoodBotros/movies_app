import 'package:movies/base.dart';
import 'package:movies/model/Geners.dart';
import 'package:movies/model/popular_response.dart';
import 'package:movies/shared/network/remote/api_manager.dart';

class BrowseViewModel extends BaseViewModel<BrowseNavigator> {
  Future<GenersResponse> getGeners() {
    return ApiManager.getGeners();
  }

  Future<TopPopular> getMovieDataList(String genres) {
    return ApiManager.getMovieDataList(genres);
  }
}

abstract class BrowseNavigator extends BaseNavigator {}
