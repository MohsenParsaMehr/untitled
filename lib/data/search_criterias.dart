import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

@JsonSerializable()
class SearchCriterias{
  String? Criteria;
  String? Type;

@override
  String toString(){
    return 'Criteria=$Criteria,Type=$Type';
  }

}
