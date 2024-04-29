import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/serializable_class.dart';
part 'api_lecture_paragraph.g.dart';

@JsonSerializable()
class APILectureParagraph {
  // @override
  // SerializableClass fromJson(Map<String, dynamic> json) {
  //   return APILectureParagraph.fromJson(json);
  // }

  factory APILectureParagraph.fromJson(Map<String, dynamic> json) =>
      _$APILectureParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$APILectureParagraphToJson(this);

  //@JsonKey(name: 'Id')
  int? id;
  int? number;
  String? lectureParagraphTitle;
  String? lectureParagraphBody;
  String? lectureParagraphInterpretation;
  int? importance;
  bool? isHighlighted;
  int? bookPageNumber;

  APILectureParagraph(
      {this.id,
      this.number,
      this.lectureParagraphTitle,
      this.lectureParagraphBody,
      this.lectureParagraphInterpretation,
      this.importance,
      this.isHighlighted,
      this.bookPageNumber});
}
