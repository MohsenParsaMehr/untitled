import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';
import 'package:untitled/network/qa_model.dart';

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';
const String apiUrl = 'localhost:44358';// /qa/GetAllQAs';

class GreenLightService {

  Future<List<APIQAQuery>> getData(String url) async {
    List<APIQAQuery> qa = [];
    try {
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      final response = await get(Uri.https(url,'qa/GetAllQAs'),headers: headers);
      if (response.statusCode == 200) {
        var qaData = jsonDecode(response.body);
        for (int i = 0; i < qaData.length; i++) {
          qa.add(APIQAQuery.fromJson(qaData[i]));
        }
      } else {
        log(response.body);
      }

    }
    catch (e) {
      print(e);
    }
    return qa;
  }
  Future<List<APIQAQuery>> getQAs(String query, int? from, int? to) async
  {
    final qaData = await getData(apiUrl) ;//as List<QuestionAndAnswer>;//?app_id=$apiId&app_key=$apiKey&q=$query&from=$from??&to=$to??');

        return qaData;
  }
}