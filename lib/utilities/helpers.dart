class Helpers {

  static bool isNetworkAvailable() {
    /*ConnectivityManager connectivityManager
                = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        return activeNetworkInfo != null && activeNetworkInfo.isConnected();*/
    return true;
  }
  static String? getLocalIpAddress(){
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
  static String getUserPhoneNumber()
  {
    /*return ((TelephonyManager) context.getSystemService(context.TELEPHONY_SERVICE))
    .getLine1Number();*/
    return '';
  }

}
