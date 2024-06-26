import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/serializable_class.dart';
part 'api_lectures_query.g.dart';

@JsonSerializable()
class APILecturesQuery extends SerializableClass {
  @override
  SerializableClass fromJson(Map<String, dynamic> json) {
    return APILecturesQuery.fromJson(json);
  }

  factory APILecturesQuery.fromJson(Map<String, dynamic> json) =>
      _$APILecturesQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APILecturesQueryToJson(this);

  //@JsonKey(name: 'Id')
  int? id;
  String? status;
  bool? isBookmarked;
  String topic;
  String? description;
  String? locale;
  String? mediaUrl;
  DateTime? publishDate;
  String? lectureBody;
  String? type;
  String? author;
  String? captionImageUrl;
  DateTime? insertDate;
  DateTime? updateDate;
  String? operatorName;

  APILecturesQuery(
      {this.id,
      required this.topic,
      this.lectureBody,
      this.type,
      this.author,
      this.captionImageUrl,
      this.description,
      this.locale,
      this.status,
      this.isBookmarked,
      this.publishDate,
      this.mediaUrl,
      this.operatorName,
      this.insertDate,
      this.updateDate});
}
