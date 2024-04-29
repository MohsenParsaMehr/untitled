// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_favourites_query.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

APIFavourites _$APIFavouritesFromJson(Map<String, dynamic> json) =>
    APIFavourites(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      contentId: json['contentId'] as int?,
      type: json['type'] as String?,
      hardnessFactor: json['hardnessFactor'] as String?,
      notes: json['notes'] as String?,
      colorTag: json['colorTag'] as String?,
      insertDate: json['insertDate'] == null
          ? null
          : DateTime.parse(json['insertDate'] as String),
      updateDate: json['updateDate'] == null
          ? null
          : DateTime.parse(json['updateDate'] as String),
    );

Map<String, dynamic> _$APIFavouritesToJson(APIFavourites instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'contentId': instance.contentId,
      'type': instance.type,
      'hardnessFactor': instance.hardnessFactor,
      'notes': instance.notes,
      'colorTag': instance.colorTag,
      'insertDate': instance.insertDate?.toIso8601String(),
      'updateDate': instance.updateDate?.toIso8601String(),
    };
