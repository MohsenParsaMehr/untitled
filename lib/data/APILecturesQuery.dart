import 'package:json_annotation/json_annotation.dart';
part 'APILecturesQuery.g.dart';

@JsonSerializable()
class APILecturesQuery {
  factory APILecturesQuery.fromJson(Map<String, dynamic> json) =>
      _$APILecturesQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APILecturesQueryToJson(this);

  //@JsonKey(name: 'Id')
  int id;
  String question;
  String answer;

  APILecturesQuery({
    required this.id,
    required this.question,
    required this.answer,
  });
}
