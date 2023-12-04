// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'APILecturesQuery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APILecturesQuery _$APILecturesQueryFromJson(Map<String, dynamic> json) =>
    APILecturesQuery(
      id: json['id'] as int?,
      topic: json['topic'] as String,
      body: json['body'] as String,
    )
      ..status = json['status'] as String?
      ..isBookmarked = json['isBookmarked'] as bool?
      ..description = json['description'] as String?
      ..locale = json['locale'] as String?
      ..mediaUrl = json['mediaUrl'] as String?
      ..forDate = json['forDate'] == null
          ? null
          : DateTime.parse(json['forDate'] as String)
      ..operatorName = json['operatorName'] as String?;

Map<String, dynamic> _$APILecturesQueryToJson(APILecturesQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'isBookmarked': instance.isBookmarked,
      'topic': instance.topic,
      'body': instance.body,
      'description': instance.description,
      'locale': instance.locale,
      'mediaUrl': instance.mediaUrl,
      'forDate': instance.forDate?.toIso8601String(),
      'operatorName': instance.operatorName,
    };
