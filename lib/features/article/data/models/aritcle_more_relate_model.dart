class ArticleMoreRelateModel {
  final String id;
  final String title;
  final String mainImageUrl;

  ArticleMoreRelateModel({
    required this.id,
    required this.title,
    required this.mainImageUrl,
  });

  factory ArticleMoreRelateModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'title': String title,
        'mainImageUrl': String mainImageUrl,
      } =>
        ArticleMoreRelateModel(
          id: id,
          title: title,
          mainImageUrl: mainImageUrl,
        ),
      _ => throw const FormatException('Unexpected JSON type'),
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'mainImageUrl': mainImageUrl,
    };
  }
}
