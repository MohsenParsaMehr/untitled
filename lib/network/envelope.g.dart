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
      json['searchCriterias'] == null
          ? null
          : SearchCriterias.fromJson(
              json['searchCriterias'] as Map<String, dynamic>),
      json['sortCriterias'] == null
          ? null
          : SortCriterias.fromJson(
              json['sortCriterias'] as Map<String, dynamic>),
      json['counter'] as int,
      json['additionalInfo'] as String?,
      json['isLoginRequired'] as bool,
      json['embedAppVersion'] as bool,
      json['embedDeviceInfo'] as bool,
      json['embedIMEI'] as bool,
      json['embedMACAddress'] as bool,
      json['embedPhoneNo'] as bool,
      json['entityJson'] as String,
    )
      ..IpAddress = json['IpAddress'] as String?
      ..Counter = json['Counter'] as int
      ..Username = json['Username'] as String?
      ..Password = json['Password'] as String?
      ..AppVersion = json['AppVersion'] as int?
      ..AdditionalInfo = json['AdditionalInfo'] as String?
      ..Credentials = json['Credentials'] as String?
      ..OsVersion = json['OsVersion'] as String?
      ..ApiLevel = json['ApiLevel'] as String?
      ..Device = json['Device'] as String?
      ..Model = json['Model'] as String?
      ..Product = json['Product'] as String?
      ..DeviceIMEI = json['DeviceIMEI'] as String?
      ..MACAddress = json['MACAddress'] as String?
      ..PhoneNo = json['PhoneNo'] as String?
      ..deviceInfo = json['deviceInfo'] as String;

Map<String, dynamic> _$EnvelopeToJson<T>(
  Envelope<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'IpAddress': instance.IpAddress,
      'Counter': instance.Counter,
      'Username': instance.Username,
      'Password': instance.Password,
      'AppVersion': instance.AppVersion,
      'AdditionalInfo': instance.AdditionalInfo,
      'Credentials': instance.Credentials,
      'OsVersion': instance.OsVersion,
      'ApiLevel': instance.ApiLevel,
      'Device': instance.Device,
      'Model': instance.Model,
      'Product': instance.Product,
      'DeviceIMEI': instance.DeviceIMEI,
      'MACAddress': instance.MACAddress,
      'PhoneNo': instance.PhoneNo,
      'searchCriterias': instance.searchCriterias,
      'sortCriterias': instance.sortCriterias,
      'deviceInfo': instance.deviceInfo,
      'entityJson': instance.entityJson,
      'entity': _$nullableGenericToJson(instance.entity, toJsonT),
      'counter': instance.counter,
      'additionalInfo': instance.additionalInfo,
      'isLoginRequired': instance.isLoginRequired,
      'embedAppVersion': instance.embedAppVersion,
      'embedDeviceInfo': instance.embedDeviceInfo,
      'embedIMEI': instance.embedIMEI,
      'embedMACAddress': instance.embedMACAddress,
      'embedPhoneNo': instance.embedPhoneNo,
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
