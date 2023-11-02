import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';
@JsonSerializable()
class SimpleRequest extends Entity {
  SimpleRequest(int id, this.locale) : super(id);
  String locale;
}