import 'package:json_annotation/json_annotation.dart';
part 'articles.g.dart';

@JsonSerializable()
class Article {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  Article({
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  Map toJson() {
    return _$ArticleToJson(this);
  }

  factory Article.fromJson(Map<dynamic, dynamic> json) {
    return _$ArticleFromJson(json);
  }
}
