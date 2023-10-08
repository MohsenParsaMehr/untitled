import 'package:json_annotation/json_annotation.dart';

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
}
