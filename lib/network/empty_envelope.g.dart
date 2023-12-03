// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyEnvelope _$EmptyEnvelopeFromJson(Map<String, dynamic> json) =>
    EmptyEnvelope(
      json['searchCriterias'] == null
          ? null
          : SearchCriterias.fromJson(
              json['searchCriterias'] as Map<String, dynamic>),
      json['sortCriterias'] == null
          ? null
          : SortCriterias.fromJson(
              json['sortCriterias'] as Map<String, dynamic>),
      json['Counter'] as int,
      json['AdditionalInfo'] as String?,
      json['isLoginRequired'] as bool,
      json['embedAppVersion'] as bool,
      json['embedDeviceInfo'] as bool,
      json['embedIMEI'] as bool,
      json['embedMACAddress'] as bool,
      json['embedPhoneNo'] as bool,
    )
      ..IpAddress = json['IpAddress'] as String?
      ..Username = json['Username'] as String?
      ..Password = json['Password'] as String?
      ..AppVersion = json['AppVersion'] as int?
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

Map<String, dynamic> _$EmptyEnvelopeToJson(EmptyEnvelope instance) =>
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
      'isLoginRequired': instance.isLoginRequired,
      'searchCriterias': instance.searchCriterias,
      'sortCriterias': instance.sortCriterias,
      'embedAppVersion': instance.embedAppVersion,
      'embedDeviceInfo': instance.embedDeviceInfo,
      'deviceInfo': instance.deviceInfo,
      'embedIMEI': instance.embedIMEI,
      'embedMACAddress': instance.embedMACAddress,
      'embedPhoneNo': instance.embedPhoneNo,
    };
