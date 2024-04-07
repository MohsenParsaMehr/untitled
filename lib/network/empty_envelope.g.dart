// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'empty_envelope.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmptyEnvelope _$EmptyEnvelopeFromJson(Map<String, dynamic> json) =>
    EmptyEnvelope(
      json['locale'] as String?,
      json['from'] as int?,
      json['pageCount'] as int?,
      json['counter'] as int,
      json['additionalInfo'] as String?,
      json['isLoginRequired'] as bool,
      json['isShuffled'] as bool?,
      json['embedAppVersion'] as bool,
      json['embedDeviceInfo'] as bool,
      json['embedIMEI'] as bool,
      json['embedMACAddress'] as bool,
      json['embedPhoneNo'] as bool,
    )
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

Map<String, dynamic> _$EmptyEnvelopeToJson(EmptyEnvelope instance) =>
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
    };
