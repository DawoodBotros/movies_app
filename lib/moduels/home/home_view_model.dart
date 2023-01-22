import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies/base.dart';
import 'package:movies/model/top_popular.dart';
import 'package:movies/shared/constants/constants.dart';

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
    }catch(e){
      print(e);
      throw (e);
    }
  }
}
