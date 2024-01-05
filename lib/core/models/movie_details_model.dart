// To parse this JSON data, do
//
//     final movieDetailModel = movieDetailModelFromJson(jsonString);

import 'dart:convert';

MovieDetailModel movieDetailModelFromJson(String str) => MovieDetailModel.fromJson(json.decode(str));

String movieDetailModelToJson(MovieDetailModel data) => json.encode(data.toJson());

class MovieDetailModel {
  int id;
  List<MovieDetailsList> movieDetailsList;

  MovieDetailModel({
    required this.id,
    required this.movieDetailsList,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) => MovieDetailModel(
    id: json["id"],
    movieDetailsList: List<MovieDetailsList>.from(json["results"].map((x) => MovieDetailsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "results": List<dynamic>.from(movieDetailsList.map((x) => x.toJson())),
  };
}

class MovieDetailsList {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String publishedAt;
  String site;
  int size;
  String type;
  bool official;
  String id;

  MovieDetailsList({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.publishedAt,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.id,
  });

  factory MovieDetailsList.fromJson(Map<String, dynamic> json) => MovieDetailsList(
    iso6391: json["iso_639_1"],
    iso31661: json["iso_3166_1"],
    name: json["name"],
    key: json["key"],
    publishedAt: json["published_at"],
    site: json["site"],
    size: json["size"],
    type: json["type"],
    official: json["official"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "iso_639_1": iso6391,
    "iso_3166_1": iso31661,
    "name": name,
    "key": key,
    "published_at": publishedAt,
    "site": site,
    "size": size,
    "type": type,
    "official": official,
    "id": id,
  };
}
