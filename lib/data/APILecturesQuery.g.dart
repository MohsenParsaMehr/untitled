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
      lectureBody: json['lectureBody'] as String?,
      type: json['type'] as String?,
      author: json['author'] as String?,
      captionImageUrl: json['captionImageUrl'] as String?,
      description: json['description'] as String?,
      locale: json['locale'] as String?,
      status: json['status'] as String?,
      isBookmarked: json['isBookmarked'] as bool?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      mediaUrl: json['mediaUrl'] as String?,
      operatorName: json['operatorName'] as String?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

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
      'publishDate': instance.publishDate?.toIso8601String(),
      'lectureBody': instance.lectureBody,
      'type': instance.type,
      'author': instance.author,
      'captionImageUrl': instance.captionImageUrl,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'operatorName': instance.operatorName,
    };
