import 'dart:convert';
import 'package:http/http.dart';
import '../../../model/Geners.dart';
import '../../../model/SourcesLatest.dart';
import '../../../model/SourcesTopRated.dart';
import '../../../model/browse_lists.dart';
import '../../../model/popular_response.dart';
import 'package:http/http.dart' as http;
import '../../../model/searchResponse.dart';
import '../../../model/similarResponse.dart';
import '../../constants/constants.dart';

class ApiManager {
  //......................... get Popular..................//
  static Future<TopPopular> getMovieDataPopular() async {
    var response = await http.get(
      Uri.parse(
          'https://$BASE/3/movie/top_rated?api_key=$APIKEY&language=en-US&page=1'),
    );
    try {
      print(response.statusCode);
      var json = jsonDecode(response.body);
      TopPopular popular = TopPopular.fromJson(json);
      return popular;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  //......................... get Latest..................//
  static Future<SourcesLatest> getMovieDataLatest() async {
    Uri URL = Uri.https(BASE, '/3/movie/latest', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      var json = jsonDecode(response.body);
      print(json);
      SourcesLatest sourcesLatest = SourcesLatest.fromJson(json);
      return sourcesLatest;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  //......................... get TopRated..................//
  static Future<SourcesTopRated> getMovieDataTopRated() async {
    Uri URL = Uri.https(BASE, '/3/movie/top_rated', {
      "api_key": APIKEY,
    });
    try {
      Response response = await http.get(URL);
      print(response);
      var json = jsonDecode(response.body);
      SourcesTopRated sourcesTopRated = SourcesTopRated.fromJson(json);
      return sourcesTopRated;
    } catch (e) {
      print(e);
      throw (e);
    }
  }

  //......................... get Similar..................//
  static Future<SimilarResponse> getSimilar({required String? movieID}) async {
    try {
      Uri url = Uri.https(BASE, '/3/movie/$movieID/similar', {
        "api_key": APIKEY,
        "movie_id": "movieID",
      });

      Response similarMovie = await http.get(url);

      var json = jsonDecode(similarMovie.body);
      SimilarResponse similarResponse = SimilarResponse.fromJson(json);

      return similarResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  //......................... get MovieSearch..................//
  static Future<SearchResponse> getMovieSearch(
      {required String movieName}) async {
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
      throw e;
    }
  }

  //......................... get Genres..................//
  static Future<GenersResponse> getGeners() async {
    try {
      Uri url = Uri.https(BASE, '/3/genre/movie/list', {
        "api_key": APIKEY,
      });
      Response browse = await http.get(url);
      print(browse);
      var json = jsonDecode(browse.body);
      print(json);
      GenersResponse genersResponse = GenersResponse.fromJson(json);
      print(genersResponse);
      return genersResponse;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  //......................... get DataList..................//
  static Future<TopPopular> getMovieDataList(String genres) async {
    var url = Uri.https(BASE, '/3/discover/movie', {
      "api_key": APIKEY,
      "with_genres": genres,
    });

    try {
      var response = await http.get(url);

      var bodyCategory = response.body;

      var json = jsonDecode(bodyCategory);

      return TopPopular.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
