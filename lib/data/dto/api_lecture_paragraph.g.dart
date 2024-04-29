// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_lecture_paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APILectureParagraph _$APILectureParagraphFromJson(Map<String, dynamic> json) =>
    APILectureParagraph(
      id: json['id'] as int?,
      number: json['number'] as int?,
      lectureParagraphTitle: json['lectureParagraphTitle'] as String?,
      lectureParagraphBody: json['lectureParagraphBody'] as String?,
      lectureParagraphInterpretation:
          json['lectureParagraphInterpretation'] as String?,
      importance: json['importance'] as int?,
      isHighlighted: json['isHighlighted'] as bool?,
      bookPageNumber: json['bookPageNumber'] as int?,
    );

Map<String, dynamic> _$APILectureParagraphToJson(
        APILectureParagraph instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'lectureParagraphTitle': instance.lectureParagraphTitle,
      'lectureParagraphBody': instance.lectureParagraphBody,
      'lectureParagraphInterpretation': instance.lectureParagraphInterpretation,
      'importance': instance.importance,
      'isHighlighted': instance.isHighlighted,
      'bookPageNumber': instance.bookPageNumber,
    };
