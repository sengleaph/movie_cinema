import 'dart:convert';

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  String? id;
  String? vistaFilmId;
  String? title;
  String? rating;
  String? synopsis;
  String? genreName;
  String? ratingDescription;
  bool? isAdvancedTicket;
  bool? hasSession;
  String? twitterTag;
  String? websiteUrl;
  String? trailerUrl;
  int? runTime;
  DateTime? openingDate;
  String? bannerImageUrl;
  String? backdropImageUrl;
  String? ageRatingImageUrl;
  String? shareUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  MovieModel({
    this.id,
    this.vistaFilmId,
    this.title,
    this.rating,
    this.synopsis,
    this.genreName,
    this.ratingDescription,
    this.isAdvancedTicket,
    this.hasSession,
    this.twitterTag,
    this.websiteUrl,
    this.trailerUrl,
    this.runTime,
    this.openingDate,
    this.bannerImageUrl,
    this.backdropImageUrl,
    this.ageRatingImageUrl,
    this.shareUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    vistaFilmId: json["vistaFilmId"],
    title: json["title"],
    rating: json["rating"],
    synopsis: json["synopsis"],
    genreName: json["genreName"],
    ratingDescription: json["ratingDescription"],
    isAdvancedTicket: json["isAdvancedTicket"],
    hasSession: json["hasSession"],
    twitterTag: json["twitterTag"],
    websiteUrl: json["websiteUrl"],
    trailerUrl: json["trailerUrl"],
    runTime: json["runTime"],
    openingDate: json["openingDate"] == null
        ? null
        : DateTime.parse(json["openingDate"]),
    bannerImageUrl: json["bannerImageUrl"],
    backdropImageUrl: json["backdropImageUrl"],
    ageRatingImageUrl: json["ageRatingImageUrl"],
    shareUrl: json["shareUrl"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vistaFilmId": vistaFilmId,
    "title": title,
    "rating": rating,
    "synopsis": synopsis,
    "genreName": genreName,
    "ratingDescription": ratingDescription,
    "isAdvancedTicket": isAdvancedTicket,
    "hasSession": hasSession,
    "twitterTag": twitterTag,
    "websiteUrl": websiteUrl,
    "trailerUrl": trailerUrl,
    "runTime": runTime,
    "openingDate": openingDate?.toIso8601String(),
    "bannerImageUrl": bannerImageUrl,
    "backdropImageUrl": backdropImageUrl,
    "ageRatingImageUrl": ageRatingImageUrl,
    "shareUrl": shareUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
