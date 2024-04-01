import "package:json_annotation/json_annotation.dart";
import "../utilities/encryption.dart";
import "empty_envelope.dart";
part 'envelope.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Envelope<T> extends EmptyEnvelope {
  T? searchCriterias;
  T? sortCriterias;
  String entityJson;
  T? entity;
  int counter = 1;
  String? additionalInfo;
  bool isLoginRequired = true;
  bool embedAppVersion = false,
      embedDeviceInfo = false,
      embedIMEI = false,
      embedMACAddress = false,
      embedPhoneNo = false;
  Envelope(
      T? entity,
      this.searchCriterias,
      this.sortCriterias,
      int counter,
      String? additionalInfo,
      bool isLoginRequired,
      bool embedAppVersion,
      bool embedDeviceInfo,
      bool embedIMEI,
      bool embedMACAddress,
      bool embedPhoneNo,
      this.entityJson)
      : super(counter, additionalInfo, isLoginRequired, embedAppVersion,
            embedDeviceInfo, embedIMEI, embedMACAddress, embedPhoneNo) {
    Credentials = Encryption.toSha256(
        "$IpAddress|||${embedDeviceInfo ? "$deviceInfo|||" : ""}$Counter${isLoginRequired ? "${Username != null ? Username! : ''}|||${Password != null ? Password! : ''}|||" : ""}${embedAppVersion ? "$AppVersion|||" : ""}${AdditionalInfo != null ? "$AdditionalInfo|||" : ""}${embedIMEI ? "$DeviceIMEI|||" : ""}${embedMACAddress ? "$MACAddress|||" : ""}${embedPhoneNo ? "$PhoneNo|||" : ""}$entityJson");
  }
  factory Envelope.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$EnvelopeFromJson(json, fromJsonT);
  Map<String, dynamic> ToJson(Object? Function(T) toJsonT) =>
      _$EnvelopeToJson(this, toJsonT);
}
