// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Envelope<T> _$EnvelopeFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Envelope<T>(
      _$nullableGenericFromJson(json['entity'], fromJsonT),
      _$nullableGenericFromJson(json['searchCriterias'], fromJsonT),
      _$nullableGenericFromJson(json['sortCriterias'], fromJsonT),
      json['from'] as int?,
      json['pageCount'] as int?,
      json['isShuffled'] as bool?,
      json['counter'] as int,
      json['additionalInfo'] as String?,
      json['isLoginRequired'] as bool,
      json['embedAppVersion'] as bool,
      json['embedDeviceInfo'] as bool,
      json['embedIMEI'] as bool,
      json['embedMACAddress'] as bool,
      json['embedPhoneNo'] as bool,
      json['entityJson'] as String?,
    )
      ..locale = json['locale'] as String?
      ..ipAddress = json['ipAddress'] as String?
      ..username = json['username'] as String?
      ..password = json['password'] as String?
      ..appVersion = json['appVersion'] as int?
      ..credentials = json['credentials'] as String?
      ..osVersion = json['osVersion'] as String?
      ..apiLevel = json['apiLevel'] as String?
      ..device = json['device'] as String?
      ..model = json['model'] as String?
      ..product = json['product'] as String?
      ..deviceIMEI = json['deviceIMEI'] as String?
      ..macAddress = json['macAddress'] as String?
      ..phoneNo = json['phoneNo'] as String?
      ..deviceInfo = json['deviceInfo'] as String;

Map<String, dynamic> _$EnvelopeToJson<T>(
  Envelope<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'locale': instance.locale,
      'from': instance.from,
      'pageCount': instance.pageCount,
      'isShuffled': instance.isShuffled,
      'ipAddress': instance.ipAddress,
      'counter': instance.counter,
      'username': instance.username,
      'password': instance.password,
      'appVersion': instance.appVersion,
      'additionalInfo': instance.additionalInfo,
      'credentials': instance.credentials,
      'osVersion': instance.osVersion,
      'apiLevel': instance.apiLevel,
      'device': instance.device,
      'model': instance.model,
      'product': instance.product,
      'deviceIMEI': instance.deviceIMEI,
      'macAddress': instance.macAddress,
      'phoneNo': instance.phoneNo,
      'isLoginRequired': instance.isLoginRequired,
      'embedAppVersion': instance.embedAppVersion,
      'embedDeviceInfo': instance.embedDeviceInfo,
      'deviceInfo': instance.deviceInfo,
      'embedIMEI': instance.embedIMEI,
      'embedMACAddress': instance.embedMACAddress,
      'embedPhoneNo': instance.embedPhoneNo,
      'searchCriterias':
          _$nullableGenericToJson(instance.searchCriterias, toJsonT),
      'sortCriterias': _$nullableGenericToJson(instance.sortCriterias, toJsonT),
      'entityJson': instance.entityJson,
      'entity': _$nullableGenericToJson(instance.entity, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
