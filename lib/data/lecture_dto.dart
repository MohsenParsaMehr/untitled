import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/data/api_lecture_paragraph.dart';
import 'package:untitled/data/serializable_class.dart';
part 'Lecture_dto.g.dart';

@JsonSerializable()
class LectureDto extends SerializableClass {
  @override
  SerializableClass fromJson(Map<String, dynamic> json) {
    return LectureDto.fromJson(json);
  }

  factory LectureDto.fromJson(Map<String, dynamic> json) =>
      _$LectureDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LectureDtoToJson(this);

  //@JsonKey(name: 'Id')
  APILecturesQuery lectureInfo;
  List<APILectureParagraph> lectureParagraphs;

  LectureDto({
    required this.lectureInfo,
    required this.lectureParagraphs,
  });
}
