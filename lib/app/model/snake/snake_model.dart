import 'dart:convert';

// Helper functions to encode/decode the SnakeModel
SnakeModel snakeModelFromJson(String str) =>
    SnakeModel.fromJson(json.decode(str));

String snakeModelToJson(SnakeModel data) => json.encode(data.toJson());

class SnakeModel {
  List<SnakeData> rows;

  SnakeModel({this.rows = const []});

  factory SnakeModel.fromJson(Map<String, dynamic> json) => SnakeModel(
    rows: json["rows"] == null
        ? []
        : List<SnakeData>.from(
        json["rows"].map((x) => SnakeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "rows": rows.map((x) => x.toJson()).toList(),
  };
}

class SnakeData {
  String? id;
  String? vistaCinemaId;
  String? vistaConcessionItemId;
  dynamic price;
  Cinema? cinema;
  dynamic mobileBannerImage;
  dynamic bannerImage;
  bool isAvailableForInSeatDelivery;
  bool isAvailableForPickupAtCounter;
  String? description;
  String? bannerImageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  SnakeData({
    this.id,
    this.vistaCinemaId,
    this.vistaConcessionItemId,
    this.price,
    this.cinema,
    this.mobileBannerImage,
    this.bannerImage,
    this.isAvailableForInSeatDelivery = false,
    this.isAvailableForPickupAtCounter = false,
    this.description,
    this.bannerImageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory SnakeData.fromJson(Map<String, dynamic> json) => SnakeData(
    id: json["id"],
    vistaCinemaId: json["vistaCinemaId"],
    vistaConcessionItemId: json["vistaConcessionItemId"],
    price: json["price"],
    cinema:
    json["cinema"] == null ? null : Cinema.fromJson(json["cinema"]),
    mobileBannerImage: json["mobileBannerImage"],
    bannerImage: json["bannerImage"],
    isAvailableForInSeatDelivery:
    json["isAvailableForInSeatDelivery"] ?? false,
    isAvailableForPickupAtCounter:
    json["isAvailableForPickupAtCounter"] ?? false,
    description: json["description"],
    bannerImageUrl: json["bannerImageUrl"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vistaCinemaId": vistaCinemaId,
    "vistaConcessionItemId": vistaConcessionItemId,
    "price": price,
    "cinema": cinema?.toJson(),
    "mobileBannerImage": mobileBannerImage,
    "bannerImage": bannerImage,
    "isAvailableForInSeatDelivery": isAvailableForInSeatDelivery,
    "isAvailableForPickupAtCounter": isAvailableForPickupAtCounter,
    "description": description,
    "bannerImageUrl": bannerImageUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Cinema {
  String? id;
  String? vistaCinemaId;
  String? name;
  String? description;
  String? openHour;
  String? closeHour;
  String? address1;
  String? address2;
  String? city;
  double? latitude;
  double? longitude;
  int? numberOfHalls;
  CinemaImage? image;
  String? bannerImageUrl;
  DateTime? createdAt;
  DateTime? updatedAt;

  Cinema({
    this.id,
    this.vistaCinemaId,
    this.name,
    this.description,
    this.openHour,
    this.closeHour,
    this.address1,
    this.address2,
    this.city,
    this.latitude,
    this.longitude,
    this.numberOfHalls,
    this.image,
    this.bannerImageUrl,
    this.createdAt,
    this.updatedAt,
  });

  factory Cinema.fromJson(Map<String, dynamic> json) => Cinema(
    id: json["id"],
    vistaCinemaId: json["vistaCinemaId"],
    name: json["name"],
    description: json["description"],
    openHour: json["openHour"],
    closeHour: json["closeHour"],
    address1: json["address1"],
    address2: json["address2"],
    city: json["city"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    numberOfHalls: json["numberOfHalls"],
    image:
    json["image"] == null ? null : CinemaImage.fromJson(json["image"]),
    bannerImageUrl: json["bannerImageUrl"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null
        ? null
        : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vistaCinemaId": vistaCinemaId,
    "name": name,
    "description": description,
    "openHour": openHour,
    "closeHour": closeHour,
    "address1": address1,
    "address2": address2,
    "city": city,
    "latitude": latitude,
    "longitude": longitude,
    "numberOfHalls": numberOfHalls,
    "image": image?.toJson(),
    "bannerImageUrl": bannerImageUrl,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class CinemaImage {
  String? id;
  String? url;
  String? name;
  String? type;

  CinemaImage({
    this.id,
    this.url,
    this.name,
    this.type,
  });

  factory CinemaImage.fromJson(Map<String, dynamic> json) => CinemaImage(
    id: json["id"],
    url: json["url"],
    name: json["name"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
    "name": name,
    "type": type,
  };
}
