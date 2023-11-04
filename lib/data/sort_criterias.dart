import 'package:json_annotation/json_annotation.dart';
part 'sort_criterias.g.dart';
@JsonSerializable()
class SortCriterias {
  SortCriterias(
    this.ByDateAscending,
    this.ByDateDescending
);
  bool ByDateAscending;
  bool ByDateDescending;
@override String toString(){
  return 'ByDateAscending:$ByDateAscending,ByDateDescending:$ByDateDescending';
}
  factory SortCriterias.fromJson(Map<String, dynamic> json) => _$SortCriteriasFromJson(json);
  Map<String, dynamic> toJson() => _$SortCriteriasToJson(this);
}
