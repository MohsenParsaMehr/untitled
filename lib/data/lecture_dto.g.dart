// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDto _$LectureDtoFromJson(Map<String, dynamic> json) => LectureDto(
      lectureInfo: APILecturesQuery.fromJson(
          json['lectureInfo'] as Map<String, dynamic>),
      lectureParagraphs: (json['lectureParagraphs'] as List<dynamic>)
          .map((e) => APILectureParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureDtoToJson(LectureDto instance) =>
    <String, dynamic>{
      'lectureInfo': instance.lectureInfo,
      'lectureParagraphs': instance.lectureParagraphs,
    };
