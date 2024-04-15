import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';
import 'package:untitled/data/api_lecture_search_criterias.dart';
import 'package:untitled/data/simple_request.dart';
import 'package:untitled/network/qa_model.dart';
import 'package:untitled/network/envelope.dart';
import 'package:untitled/utilities/settings.dart';

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';
const String apiUrl = 'localhost:44358'; // /qa/GetAllQAs';

class GreenLightService {
  static int serviceRequestCounter = 0;
  Future<List<APIQAQuery>> getData(String url) async {
    List<APIQAQuery> qa = [];
    try {
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      //final response =
      // await get(Uri.https(url, 'qa/GetAllQAs'), headers: headers);
      SimpleRequest simpleRequest = SimpleRequest(-1, Settings.locale);
      Envelope<SimpleRequest, SimpleRequest> qaEnvelope = Envelope(
          simpleRequest,
          null,
          null,
          Settings.locale,
          null,
          null,
          false,
          ++serviceRequestCounter,
          null,
          false,
          false,
          false,
          false,
          false,
          false,
          '');
      final postResponse = await post(Uri.https(url, 'qa/GetQAs'),
          headers: headers,
          body: jsonEncode(
            qaEnvelope.ToJson((data) => simpleRequest.toJson(data),
                (d2) => simpleRequest.toJson(d2)),
          ));

      if (postResponse.statusCode == 200) {
        var qaData = jsonDecode(postResponse.body);
        for (int i = 0; i < qaData.length; i++) {
          qa.add(APIQAQuery.fromJson(qaData[i]));
        }
      } else {
        log(postResponse.body);
      }
    } catch (e) {
      List<APIQAQuery> errorQa = []; //= <APIQAQuery>{};
      errorQa.add(APIQAQuery(id: -1, question: e.toString(), answer: 'Error'));
      return Future.value(errorQa);

      // print(e);
    }
    return qa;
  }

  Future<List<APIQAQuery>> getQAs(String query, int? from, int? to) async {
    final qaData = await getData(
        query); //as List<QuestionAndAnswer>;//?app_id=$apiId&app_key=$apiKey&q=$query&from=$from??&to=$to??');

    return qaData;
  }
}
