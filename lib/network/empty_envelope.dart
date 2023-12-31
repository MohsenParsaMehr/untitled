import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import '../data/search_criterias.dart';
import '../data/sort_criterias.dart';
import '../utilities/encryption.dart';
import '../utilities/helpers.dart';
import '../utilities/user_management.dart';

part 'empty_envelope.g.dart';
@JsonSerializable()
class EmptyEnvelope {
  String? IpAddress;
  int Counter=1;
  String? Username;
  String? Password;
  int? AppVersion;
  String? AdditionalInfo;
  String? Credentials;
  String? OsVersion;
  String? ApiLevel;
  String? Device;
  String? Model;
  String? Product;
  String? DeviceIMEI;
  String? MACAddress;
  String? PhoneNo;
  bool isLoginRequired = true;
  SearchCriterias? searchCriterias;//
  SortCriterias? sortCriterias;
  bool embedAppVersion = false;
  bool embedDeviceInfo = false;
  String deviceInfo="";
  bool embedIMEI = false;
  bool embedMACAddress = false;
  bool embedPhoneNo = false;

  EmptyEnvelope(this.searchCriterias, this.sortCriterias,
  int Counter,String? AdditionalInfo, bool isLoginRequired,
      bool embedAppVersion, bool embedDeviceInfo, bool embedIMEI
      , bool embedMACAddress, bool embedPhoneNo) {
  IpAddress = Helpers.getLocalIpAddress();
  if(embedDeviceInfo) {
  OsVersion ='os version here';//System.getProperty("os.version");
  ApiLevel = 'api level here';//android.os.Build.VERSION.SDK ;
  Device =  'device here';//android.os.Build.DEVICE ;
  Model = 'model here';//android.os.Build.MODEL;
  Product = 'product here';//android.os.Build.PRODUCT ;
  deviceInfo = "$OsVersion|||$ApiLevel|||$Device|||$Model|||$Product";
  }
  //Counter = counter;
  if(isLoginRequired) {
  if(!UserManagement.isUserLoggedIn()) {
    throw Exception("Login Required");
  }

  Username = UserManagement.getLoggedInUserInfo()?.Username;
  Password = UserManagement.getLoggedInUserInfo()?.Password;
  }
  if(embedAppVersion) {
  try {
  //PackageInfo pInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
  AppVersion = 1;//pInfo.versionCode;
  }
  on Exception {
  embedAppVersion = false;
  //ignore exception, it's not so important
  }
  }

  if(embedIMEI){
  //TelephonyManager telephonyManager = (TelephonyManager)context.getSystemService(Context.TELEPHONY_SERVICE);
  DeviceIMEI = '';//telephonyManager.getDeviceId();

  }
  if(embedMACAddress){
  //WifiManager manager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
  MACAddress = '';//manager.getConnectionInfo().getMacAddress();
  }
  if(embedPhoneNo){
  PhoneNo = Helpers.getUserPhoneNumber();
  }
  Credentials = Encryption.toSha256("$IpAddress|||${embedDeviceInfo ? "$deviceInfo|||" : ""}$Counter${isLoginRequired ? "$Username|||$Password|||" : ""}${embedAppVersion ? "$AppVersion|||" : ""}${AdditionalInfo != null ? "$AdditionalInfo|||" : ""}${embedIMEI?"$DeviceIMEI|||":""}${embedMACAddress?"$MACAddress|||":""}${embedPhoneNo?(PhoneNo!=null?PhoneNo!:''):""}${searchCriterias==null?"":"$searchCriterias|||"}${sortCriterias == null?"":"$sortCriterias|||"}");
}
  factory EmptyEnvelope.fromJson(Map<String, dynamic> json) => _$EmptyEnvelopeFromJson(json);
  Map<String, dynamic> toJson() => _$EmptyEnvelopeToJson(this);
}
