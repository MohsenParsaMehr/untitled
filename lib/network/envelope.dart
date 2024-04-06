import "package:json_annotation/json_annotation.dart";
import "../utilities/encryption.dart";
import "empty_envelope.dart";
part 'envelope.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Envelope<T> extends EmptyEnvelope {
  T? searchCriterias;
  T? sortCriterias;
  String? entityJson;
  T? entity;
  //int counter = 1;

  // String? additionalInfo;
  //bool isLoginRequired = false;
  //bool embedAppVersion = false,
  //   embedDeviceInfo = false,
  //   embedIMEI = false,
  //  embedMACAddress = false,
  //   embedPhoneNo = false;
  Envelope(
      T? entity,
      this.searchCriterias,
      this.sortCriterias,
      int? from,
      int? pageCount,
      bool? isShuffled,
      int counter,
      String? additionalInfo,
      bool isLoginRequired,
      bool embedAppVersion,
      bool embedDeviceInfo,
      bool embedIMEI,
      bool embedMACAddress,
      bool embedPhoneNo,
      this.entityJson)
      : super(
            from,
            pageCount,
            counter,
            additionalInfo,
            isLoginRequired,
            isShuffled,
            embedAppVersion,
            embedDeviceInfo,
            embedIMEI,
            embedMACAddress,
            embedPhoneNo) {
    credentials = Encryption.toSha256(
        "$ipAddress|||${embedDeviceInfo ? "$deviceInfo|||" : ""}$counter${isLoginRequired ? "${username != null ? username! : ''}|||${password != null ? password! : ''}|||" : ""}${embedAppVersion ? "$appVersion|||" : ""}${additionalInfo != null ? "$additionalInfo|||" : ""}${embedIMEI ? "$deviceIMEI|||" : ""}${embedMACAddress ? "$macAddress|||" : ""}${embedPhoneNo ? "$phoneNo|||" : ""}$entityJson");
  }
  factory Envelope.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$EnvelopeFromJson(json, fromJsonT);
  Map<String, dynamic> ToJson(Object? Function(T) toJsonT) =>
      _$EnvelopeToJson(this, toJsonT);
}
