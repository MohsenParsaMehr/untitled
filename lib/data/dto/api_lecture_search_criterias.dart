import 'package:json_annotation/json_annotation.dart';
import 'package:untitled/data/serializable_class.dart';
part 'api_lecture_search_criterias.g.dart';

@JsonSerializable()
class LectureSearchCriterias {
  // @override
  // SerializableClass fromJson(Map<String, dynamic> json) {
  //   return APILectureParagraph.fromJson(json);
  // }

  factory LectureSearchCriterias.fromJson(Map<String, dynamic> json) =>
      _$LectureSearchCriteriasFromJson(json);

  Map<String, dynamic> toJson() => _$LectureSearchCriteriasToJson(this);

  //@JsonKey(name: 'Id')
  int? id;
  String? locale;
  String? type;
  String? searchTerm;
  DateTime? publishDate;
  String? publishDateSearchOperator;
  DateTime? publishDateTo;
  String? author;
  String? status;
  DateTime? insertDate;
  String? insertDateSearchOperator;
  DateTime? insertDateTo;
  DateTime? updateDate;
  String? updateDateSearchOperator;
  DateTime? updateDateTo;
  int? bookPageNumber;
  LectureSearchCriterias(
      {this.id,
      this.locale,
      this.type,
      this.searchTerm,
      this.publishDate,
      this.publishDateSearchOperator,
      this.publishDateTo,
      this.author,
      this.status,
      this.insertDate,
      this.insertDateSearchOperator,
      this.insertDateTo,
      this.updateDate,
      this.updateDateSearchOperator,
      this.updateDateTo,
      this.bookPageNumber});
}
