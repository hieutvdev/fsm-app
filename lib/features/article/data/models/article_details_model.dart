class ArticleDetailsModel {
  final String id;
  final String title;
  final String description;
  final String mainImageUrl;
  final String content;
  final String slug;
  final String? publishAt;
  final String tags;
  final String categoryName;
  final String authorId;

  ArticleDetailsModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.description,
      required this.mainImageUrl,
      required this.slug,
      this.publishAt,
      required this.tags,
      required this.categoryName,
      required this.authorId});

  factory ArticleDetailsModel.fromJson(Map<String, dynamic> json) {
    return ArticleDetailsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      mainImageUrl: json['mainImageUrl'],
      slug: json['slug'],
      publishAt: json['publishAt'],
      tags: json['tags'],
      categoryName: json['categoryName'],
      authorId: json['authorId'],
      content: json['content'],
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
      'authorId': authorId,
      'content': content,
    };
  }
}
