// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_lecture_search_criterias.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APILectureSearchCriterias _$APILectureSearchCriteriasFromJson(
        Map<String, dynamic> json) =>
    APILectureSearchCriterias(
      id: json['id'] as int?,
      locale: json['locale'] as String?,
      type: json['type'] as String?,
      searchTerm: json['searchTerm'] as String?,
      publishDate: json['publishDate'] == null
          ? null
          : DateTime.parse(json['publishDate'] as String),
      publishDateSearchOperator: json['publishDateSearchOperator'] as String?,
      publishDateTo: json['publishDateTo'] == null
          ? null
          : DateTime.parse(json['publishDateTo'] as String),
      author: json['author'] as String?,
      status: json['status'] as String?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      insertDateSearchOperator: json['insertDateSearchOperator'] as String?,
      insertDateTo: json['insertDateTo'] == null
          ? null
          : DateTime.parse(json['insertDateTo'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
      updateDateSearchOperator: json['updateDateSearchOperator'] as String?,
      updateDateTo: json['updateDateTo'] == null
          ? null
          : DateTime.parse(json['updateDateTo'] as String),
      bookPageNumber: json['bookPageNumber'] as int?,
    );

Map<String, dynamic> _$APILectureSearchCriteriasToJson(
        APILectureSearchCriterias instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': instance.locale,
      'type': instance.type,
      'searchTerm': instance.searchTerm,
      'publishDate': instance.publishDate?.toIso8601String(),
      'publishDateSearchOperator': instance.publishDateSearchOperator,
      'publishDateTo': instance.publishDateTo?.toIso8601String(),
      'author': instance.author,
      'status': instance.status,
      'insertDate': instance.insertDate?.toIso8601String(),
      'insertDateSearchOperator': instance.insertDateSearchOperator,
      'insertDateTo': instance.insertDateTo?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
      'updateDateSearchOperator': instance.updateDateSearchOperator,
      'updateDateTo': instance.updateDateTo?.toIso8601String(),
      'bookPageNumber': instance.bookPageNumber,
    };
