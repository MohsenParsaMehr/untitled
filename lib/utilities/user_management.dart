import 'dart:io';
import '../data/User.dart';
import 'encryption.dart';
import 'file_io_helper.dart';

class UserManagement {
  static UserManagement? _userManagement;
  static const String USER_LOGIN_INFO_FILE_NAME = "user_info.jsd";
  static User? _loggedInUserInfo ;
  //private static UserLoginResult loggedInUserInfo = null;
  static bool _isLoggedIn = false;
  //static List<Comment> comments = [];

  static UserManagement getInstance(){
    if (_userManagement != null) {
      return _userManagement!;
    }
    else {
      return _userManagement = UserManagement();
    }
  }

  static User? getLoggedInUserInfo(){
    if(_loggedInUserInfo == null) {
      _loggedInUserInfo = User();
    }
    return _loggedInUserInfo;
  }

  static String getToken(){
    DateTime calendar = DateTime.now();
    String token = "${"${getLoggedInUserInfo()!.Username != null?getLoggedInUserInfo()!.Username!:''}\n${getLoggedInUserInfo()!.Password != null?getLoggedInUserInfo()!.Password!:''}\n${calendar.hour}:${calendar.minute}:${calendar.second}"}:${calendar.millisecond}";
    return Encryption.toSymerticEncryption(token);
  }
  static void setUserInfo(User user){
    _loggedInUserInfo = user;

  }
  static bool isUserLoggedIn(){
    /*if(!_isLoggedIn ){
      try {
        _loggedInUserInfo = FileIOHelper.readObjectFromFile(USER_LOGIN_INFO_FILE_NAME,User.class);
        _isLoggedIn = true;
      }
    on IOException catch (fnfe){
    _isLoggedIn = false;
    }*/
    return false;

  }
  static void logout(){
    _loggedInUserInfo = null;
    savePreferences();
  }

  static void savePreferences(){
    FileIOHelper.writeObjectToFile(USER_LOGIN_INFO_FILE_NAME,_loggedInUserInfo!);
  }
  static void loadPreferences(){
    /*try {
      _loggedInUserInfo = FileIOHelper.readObjectFromFile(USER_LOGIN_INFO_FILE_NAME,User.class);
    }
    on IOException catch (fnfe){
    //ignore
    }

    FileIOHelper.readObjectFromPreferences(Constants.USER_COMMENTS, comments.getClass());*/

  }

}
