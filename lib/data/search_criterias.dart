import 'package:json_annotation/json_annotation.dart';

part 'search_criterias.g.dart';
@JsonSerializable()
class SearchCriterias{
  String? Criteria;
  String? Type;
  SearchCriterias();
@override
  String toString(){
    return 'Criteria=$Criteria,Type=$Type';
  }
  factory SearchCriterias.fromJson(Map<String, dynamic> json) => _$SearchCriteriasFromJson(json);
  Map<String, dynamic> toJson() => _$SearchCriteriasToJson(this);
}
