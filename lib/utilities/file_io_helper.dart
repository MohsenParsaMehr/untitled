import 'dart:io';
import 'dart:convert'; //to convert json to maps and vice versa
import 'package:path_provider/path_provider.dart';
class FileIOHelper {
  File? jsonFile ;
  Directory? dir ;
  String fileName = "myJSONFile.json";
  bool fileExists = false;
  Map<String, String>? fileContent ;
  FileIOHelper(){
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = File("${dir?.path}/$fileName");
      fileExists = jsonFile!.existsSync();
      ///if (fileExists) ( fileContent = JsonDecoder(jsonFile.readAsStringSync());
    });
  }
   static bool writeToFile(String fileName,String content) {
    /*try {
      OutputStreamWriter out = OutputStreamWriter(context.openFileOutput(
          fileName, 0), "utf-8");

      out.write(content);
      out.close();
      return true;
    } on Exception catch (_)  {
      rethrow;
    }*/
     return false;
  }
  static bool writeObjectToFile(String fileName,Object object){
    return false;// writeToFile(fileName,Gson().toJson(object));
  }
/*
static void saveObjectToPreferences(Context context, String key, Object objectToSave){
  SharedPreferences mPrefs=context.getSharedPreferences(context.getApplicationInfo().name, Context.MODE_PRIVATE);
  SharedPreferences.Editor ed=mPrefs.edit();
  Gson gson = Gson();
  ed.putString(key, gson.toJson(objectToSave));
  ed.commit();
}*/
/*static <T> T readObjectFromPreferences(String key, Class<T> objectClass){

  SharedPreferences mPrefs=context.getSharedPreferences(context.getApplicationInfo().name);
  return GsonBuilder().create().fromJson(mPrefs.getString(key,null),objectClass);

}*/

/*static String ReadFromFile(Context context, String fileName) {
  StringBuffer buffer = StringBuffer();
  try {
  InputStream inp = context.openFileInput(fileName);
  if (inp != null) {
  InputStreamReader tmp = InputStreamReader(in);
  BufferedReader reader = BufferedReader(tmp);
  String str;
  while ((str = reader.readLine()) != null) {
  buffer.append(str + "\n");
  }
  in.close();
  }
  } catch (exception) {
  // that's OK, we probably haven't created it yet
  rethrow;
  }
}
return (buffer!= null? buffer.substring(0,buffer.length()-1):null);
}*/
}
