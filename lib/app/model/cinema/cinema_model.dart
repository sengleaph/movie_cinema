class CinemaModel {
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
  ImageData? image;
  String? bannerImageUrl;
  String? createdAt;
  String? updatedAt;

  CinemaModel({
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

  factory CinemaModel.fromJson(Map<String, dynamic> json) {
    return CinemaModel(
      id: json['id'],
      vistaCinemaId: json['vistaCinemaId'],
      name: json['name'],
      description: json['description'],
      openHour: json['openHour'],
      closeHour: json['closeHour'],
      address1: json['address1'],
      address2: json['address2'],
      city: json['city'],
      latitude: json['latitude']?.toDouble(),
      longitude: json['longitude']?.toDouble(),
      numberOfHalls: json['numberOfHalls'],
      image: json['image'] != null ? ImageData.fromJson(json['image']) : null,
      bannerImageUrl: json['bannerImageUrl'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}

class ImageData {
  String? id;
  String? url;
  String? name;
  String? type;

  ImageData({this.id, this.url, this.name, this.type});

  factory ImageData.fromJson(Map<String, dynamic> json) {
    return ImageData(
      id: json['id'],
      url: json['url'],
      name: json['name'],
      type: json['type'],
    );
  }
}
