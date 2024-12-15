class ArticleItemListModel {
  final String id;
  final String title;
  final String description;
  final String mainImageUrl;
  final String slug;
  final DateTime? publishAt;
  final String tags;
  final String categoryName;

  ArticleItemListModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.mainImageUrl,
      required this.slug,
      this.publishAt,
      required this.tags,
      required this.categoryName});

  factory ArticleItemListModel.fromJson(Map<String, dynamic> json) {
    return ArticleItemListModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      mainImageUrl: json['mainImageUrl'],
      slug: json['slug'],
      publishAt: json['publishAt'],
      tags: json['tags'],
      categoryName: json['categoryName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'mainImageUrl': mainImageUrl,
      'slug': slug,
      'publishAt': publishAt,
      'tags': tags,
      'categoryName': categoryName,
    };
  }
}
