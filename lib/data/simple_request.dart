import 'package:json_annotation/json_annotation.dart';
import 'entity.dart';
part 'simple_request.g.dart';

@JsonSerializable()
class SimpleRequest extends Entity {
  SimpleRequest(int id, this.locale) : super(id);
  String locale;
  Map<String, dynamic> toJson(SimpleRequest s) => _$SimpleRequestToJson(this);
  factory SimpleRequest.fromJson(Map<String, dynamic> json) => _$SimpleRequestFromJson(json);
}