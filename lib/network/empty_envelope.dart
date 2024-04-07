import 'dart:core';
import 'package:json_annotation/json_annotation.dart';
import '../utilities/encryption.dart';
import '../utilities/helpers.dart';
import '../utilities/user_management.dart';

part 'empty_envelope.g.dart';

@JsonSerializable()
class EmptyEnvelope {
  String? locale;
  int? from;
  int? pageCount;
  bool? isShuffled;
  String? ipAddress;
  int counter = 1;
  String? username;
  String? password;
  int? appVersion;
  String? additionalInfo;
  String? credentials;
  String? osVersion;
  String? apiLevel;
  String? device;
  String? model;
  String? product;
  String? deviceIMEI;
  String? macAddress;
  String? phoneNo;
  bool isLoginRequired = false;
  //SearchCriterias? searchCriterias;//
  //SortCriterias? sortCriterias;
  bool embedAppVersion = false;
  bool embedDeviceInfo = false;
  String deviceInfo = "";
  bool embedIMEI = false;
  bool embedMACAddress = false;
  bool embedPhoneNo = false;

  EmptyEnvelope(
      this.locale,
      this.from,
      this.pageCount,
      this.counter,
      this.additionalInfo,
      this.isLoginRequired,
      this.isShuffled,
      this.embedAppVersion,
      this.embedDeviceInfo,
      this.embedIMEI,
      this.embedMACAddress,
      this.embedPhoneNo) {
    ipAddress = Helpers.getLocalIpAddress();
    if (embedDeviceInfo) {
      osVersion = 'os version here';
      apiLevel = 'api level here';
      device = 'device here';
      model = 'model here';
      product = 'product here';
      deviceInfo = "$osVersion|||$apiLevel|||$device|||$model|||$product";
    }
    //Counter = counter;
    if (isLoginRequired) {
      if (!UserManagement.isUserLoggedIn()) {
        throw Exception("Login Required");
      }

      username = UserManagement.getLoggedInUserInfo()?.Username;
      password = UserManagement.getLoggedInUserInfo()?.Password;
    }
    if (embedAppVersion) {
      try {
        //PackageInfo pInfo = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
        appVersion = 1; //pInfo.versionCode;
      } on Exception {
        embedAppVersion = false;
        //ignore exception, it's not so important
      }
    }

    if (embedIMEI) {
      //TelephonyManager telephonyManager = (TelephonyManager)context.getSystemService(Context.TELEPHONY_SERVICE);
      deviceIMEI = ''; //telephonyManager.getDeviceId();
    }
    if (embedMACAddress) {
      //WifiManager manager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
      macAddress = ''; //manager.getConnectionInfo().getMacAddress();
    }
    if (embedPhoneNo) {
      phoneNo = Helpers.getUserPhoneNumber();
    }
    credentials = Encryption.toSha256(
        "$ipAddress|||${embedDeviceInfo ? "$deviceInfo|||" : ""}$counter${isLoginRequired ? "$username|||$password|||" : ""}${embedAppVersion ? "$appVersion|||" : ""}${additionalInfo != null ? "$additionalInfo|||" : ""}${embedIMEI ? "$deviceIMEI|||" : ""}${embedMACAddress ? "$macAddress|||" : ""}${embedPhoneNo ? (phoneNo != null ? phoneNo! : '') : ""}"); //${searchCriterias==null?"":"$searchCriterias|||"}${sortCriterias == null?"":"$sortCriterias|||"}");
  }
  factory EmptyEnvelope.fromJson(Map<String, dynamic> json) =>
      _$EmptyEnvelopeFromJson(json);
  Map<String, dynamic> toJson() => _$EmptyEnvelopeToJson(this);
}
