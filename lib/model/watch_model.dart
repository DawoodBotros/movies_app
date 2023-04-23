class WatchListModel {

  String? backdropPath;
  String? id;
  String? overview;
  String? releaseDate;
  String? title;
  bool? video = false;
  num? voteAverage;

  WatchListModel({
    this.backdropPath,
    this.id,
    this.overview,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
  });

  WatchListModel.fromJson(dynamic json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = backdropPath;
    map['id'] = id;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;

    return map;
  }
}