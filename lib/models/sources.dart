import 'package:json_annotation/json_annotation.dart';
part 'sources.g.dart';

@JsonSerializable()
class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;
  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });

  Map toJson() {
    return _$SourceToJson(this);
  }

  factory Source.fromJson(Map<dynamic, dynamic> json) {
    return _$SourceFromJson(json);
  }
}
