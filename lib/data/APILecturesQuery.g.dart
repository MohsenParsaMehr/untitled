// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'APILecturesQuery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APILecturesQuery _$APILecturesQueryFromJson(Map<String, dynamic> json) =>
    APILecturesQuery(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$APILecturesQueryToJson(APILecturesQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
