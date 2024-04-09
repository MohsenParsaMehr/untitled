// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDto _$LectureDtoFromJson(Map<String, dynamic> json) => LectureDto(
      lectureParagraphs: (json['lectureParagraphs'] as List<dynamic>?)
          ?.map((e) => APILectureParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..id = json['id'] as int?
      ..status = json['status'] as String?
      ..isBookmarked = json['isBookmarked'] as bool?
      ..topic = json['topic'] as String
      ..description = json['description'] as String?
      ..locale = json['locale'] as String?
      ..mediaUrl = json['mediaUrl'] as String?
      ..publishDate = json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String)
      ..lectureBody = json['lectureBody'] as String?
      ..type = json['type'] as String?
      ..author = json['author'] as String?
      ..captionImageUrl = json['captionImageUrl'] as String?
      ..insertDate = json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String)
      ..updateDate = json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String)
      ..operatorName = json['operatorName'] as String?;

Map<String, dynamic> _$LectureDtoToJson(LectureDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'isBookmarked': instance.isBookmarked,
      'topic': instance.topic,
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
      'lectureParagraphs': instance.lectureParagraphs,
    };
