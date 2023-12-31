import 'package:json_annotation/json_annotation.dart';
part 'APILecturesQuery.g.dart';

@JsonSerializable()
class APILecturesQuery {
  factory APILecturesQuery.fromJson(Map<String, dynamic> json) =>
      _$APILecturesQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APILecturesQueryToJson(this);

  //@JsonKey(name: 'Id')
  int? id;
  String? status;
  bool? isBookmarked;
  String topic;
  String body;
  String? description;
  String? locale;
  String? mediaUrl;
  DateTime? forDate;
  String? operatorName;

  APILecturesQuery({
    this.id,
    required this.topic,
    required this.body,
  });
}
