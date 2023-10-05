import 'package:json_annotation/json_annotation.dart';
part 'qa_model.g.dart';

@JsonSerializable()
class APIQAQuery {
  factory APIQAQuery.fromJson(Map<String, dynamic> json) =>
      _$APIQAQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIQAQueryToJson(this);

  //@JsonKey(name: 'Id')
  int id;
  String question;
  String answer;

  APIQAQuery({
    required this.id,
    required this.question,
    required this.answer,
  });
}