import "package:json_annotation/json_annotation.dart";
import "../data/search_criterias.dart";
import "../data/sort_criterias.dart";
import "../utilities/encryption.dart";
import "empty_envelope.dart";
part 'envelope.g.dart';
@JsonSerializable(genericArgumentFactories: true)
class Envelope<T> extends EmptyEnvelope {

  String entityJson;
  T? entity;
  int counter  = 1;
  String? additionalInfo;
  bool isLoginRequired = true;
  bool embedAppVersion = false,  embedDeviceInfo = false,  embedIMEI = false,  embedMACAddress = false,  embedPhoneNo = false;
   Envelope(T? entity, SearchCriterias? searchCriterias, SortCriterias? sortCriterias, int counter, String? additionalInfo, bool isLoginRequired,
      bool embedAppVersion, bool embedDeviceInfo, bool embedIMEI, bool embedMACAddress, bool embedPhoneNo, this.entityJson):
    super(searchCriterias, sortCriterias, counter,additionalInfo,isLoginRequired,embedAppVersion,embedDeviceInfo,embedIMEI,embedMACAddress,embedPhoneNo)
   {
    Credentials = Encryption.toSha256("$IpAddress|||${embedDeviceInfo ? "$deviceInfo|||" : ""}$Counter${isLoginRequired ? "${Username!= null?Username!:''}|||${Password != null?Password!:''}|||" : ""}${embedAppVersion ? "$AppVersion|||" : ""}${AdditionalInfo != null ? "$AdditionalInfo|||" : ""}${embedIMEI? "$DeviceIMEI|||":""}${embedMACAddress?"$MACAddress|||":""}${embedPhoneNo?"$PhoneNo|||":""}${searchCriterias==null?"":"$searchCriterias|||"}${sortCriterias == null?"":"$sortCriterias|||"}$entityJson");
   }
  factory Envelope.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$EnvelopeFromJson(json,fromJsonT);
  Map<String, dynamic> ToJson(Object? Function(T) toJsonT) => _$EnvelopeToJson(this,toJsonT);
}
