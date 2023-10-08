// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIQAQuery _$APIQAQueryFromJson(Map<String, dynamic> json) => APIQAQuery(
      id: json['id'] as int,
      question: json['question'] as String,
      answer: json['answer'] as String,
    );

Map<String, dynamic> _$APIQAQueryToJson(APIQAQuery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answer': instance.answer,
    };
