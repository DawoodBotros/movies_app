class GenersResponse {
  Geners({
    List<Genres>? genres,
  }) {
    _genres = genres;
  }

  GenersResponse.fromJson(dynamic json) {
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
  }

  List<Genres>? _genres;

  GenersResponse copyWith({
    List<Genres>? genres,
  }) =>
      Geners(
        genres: genres ?? _genres,
      );

  List<Genres>? get genres => _genres;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Genres {
  Genres({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
