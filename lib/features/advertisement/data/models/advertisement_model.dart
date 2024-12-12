class AdvertisementModel {
  final String id;
  final String? domainUrl;
  final String url;
  final String imageUrl;

  AdvertisementModel({
    required this.id,
    this.domainUrl,
    required this.url,
    required this.imageUrl,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) {
    return AdvertisementModel(
      id: json['id'],
      domainUrl: json['domainUrl'],
      url: json['url'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'domainUrl': domainUrl,
      'url': url,
      'imageUrl': imageUrl,
    };
  }
}
