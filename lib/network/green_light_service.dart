import 'dart:developer';
import 'package:http/http.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';
const String apiUrl = 'https://localhost:44358/qa/GetAllQAs';

class GreenLightService {

  Future getData(String url) async {

    final response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      log(response.body);
    }
  }
  Future<List<QuestionAndAnswer>> getQAs(String query, int? from, int? to) async
  {
    final qaData = await getData(apiUrl);//?app_id=$apiId&app_key=$apiKey&q=$query&from=$from??&to=$to??');
        return qaData;
    }
}