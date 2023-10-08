import 'package:crypto/crypto.dart';

class Encryption {
  static String toSha1(String value) {
    return value;
  }
  static String toSha256(String base) {
   return base;
  }
  static String toSymerticEncryption(String value){
    throw Exception("NOT IMPLEMENTED");
  }
}
