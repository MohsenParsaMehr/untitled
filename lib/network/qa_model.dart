import 'package:json_annotation/json_annotation.dart';
part 'qa_model.g.dart';

@JsonSerializable()
class APIQAQuery {
  factory APIQAQuery.fromJson(Map<String, dynamic> json) =>
      _$APIQAQueryFromJson(json);

  Map<String, dynamic> toJson() => _$APIQAQueryToJson(this);

  //@JsonKey(name: 'Id')
  int Id;
  String Question;
  String Answer;

  APIQAQuery({
    required this.Id,
    required this.Question,
    required this.Answer,
  });
}