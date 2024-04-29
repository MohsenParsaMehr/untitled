import 'package:json_annotation/json_annotation.dart';
part 'api_favourites_query.g.dart';

@JsonSerializable()
class APIFavourites {
  // @override
  // SerializableClass fromJson(Map<String, dynamic> json) {
  //   return APILectureParagraph.fromJson(json);
  // }

  factory APIFavourites.fromJson(Map<String, dynamic> json) =>
      _$APIFavouritesFromJson(json);

  Map<String, dynamic> toJson() => _$APIFavouritesToJson(this);

  //@JsonKey(name: 'Id')
  int? id;
  int? userId;
  int? contentId;
  String? type;
  String? hardnessFactor;
  String? notes;
  String? colorTag;
  DateTime? insertDate;
  DateTime? updateDate;

  APIFavourites(
      {this.id,
      this.userId,
      this.contentId,
      this.type,
      this.hardnessFactor,
      this.notes,
      this.colorTag,
      this.insertDate,
      this.updateDate});
}
