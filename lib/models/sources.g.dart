// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<dynamic, dynamic> json) {
  return Source(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    category: json['category'] as String,
    country: json['country'] as String,
    language: json['language'] as String,
  );
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'category': instance.category,
      'country': instance.country,
      'language': instance.language,
    };
