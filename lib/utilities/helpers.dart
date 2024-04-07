import 'dart:io';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:untitled/utilities/settings.dart';

class Helpers {
  static Future<bool> isNetworkAvailable() async {
    try {
      final result = await InternetAddress.lookup(Settings.baseUrl);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }

  static Jalali convertToJalali(DateTime gregorianDateTime) {
    var gregorianDate = Gregorian(
        gregorianDateTime.year, gregorianDateTime.month, gregorianDateTime.day);
    var shamsiDate = gregorianDate.toJalali();
    return shamsiDate;
  }

  static String? getLocalIpAddress() {
    /*try {
      for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces();
      en.hasMoreElements();) {
        NetworkInterface intf = en.nextElement();
        for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements();) {
          InetAddress inetAddress = enumIpAddr.nextElement();
          if (!inetAddress.isLoopbackAddress()) {
            return inetAddress.getHostAddress().toString();
          }
        }
      }
    } catch  ( ex) {
    ex.printStackTrace();
    Log.e("IP Address", ex.toString());
    }*/
    return null;
  }

  static String getUserPhoneNumber() {
    /*return ((TelephonyManager) context.getSystemService(context.TELEPHONY_SERVICE))
    .getLine1Number();*/
    return '';
  }
}
