import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/data/api_lecture_paragraph.dart';
part 'lecture_dto.g.dart';

@JsonSerializable()
class LectureDto extends APILecturesQuery {
  factory LectureDto.fromJson(Map<String, dynamic> json) =>
      _$LectureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDtoToJson(this);

  //@JsonKey(name: 'Id')
  //APILecturesQuery lectureInfo;
  List<APILectureParagraph>? lectureParagraphs = [];

  LectureDto({
    this.lectureParagraphs,
  }) : super(topic: '');
}
