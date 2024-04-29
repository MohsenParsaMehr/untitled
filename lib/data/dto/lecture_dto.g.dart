// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDto _$LectureDtoFromJson(Map<String, dynamic> json) => LectureDto(
      lectureParagraphs: (json['lectureParagraphs'] as List<dynamic>?)
          ?.map((e) => APILectureParagraph.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LectureDtoToJson(LectureDto instance) =>
    <String, dynamic>{
      'lectureParagraphs': instance.lectureParagraphs,
    };
