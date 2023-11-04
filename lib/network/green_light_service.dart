import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:untitled/data/simple_request.dart';
import 'package:untitled/network/qa_model.dart';
import 'package:untitled/network/envelope.dart';

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';
const String apiUrl = 'localhost:44358';// /qa/GetAllQAs';

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
      final response = await get(Uri.https(url,'qa/GetAllQAs'),headers: headers);
      Envelope<SimpleRequest> qaEnvelope = Envelope(SimpleRequest(-1,"en-US"), null, null, ++serviceRequestCounter, null, false, false, false, false, false, false, '');
      final postResponse = await post(Uri.https(url,'qa/GetQAs'),
        headers: headers,
        body: qaEnvelope.toJson() ,);
      /// sample of envelope
      ///Envelope<User> userInfoEnvelope = new Envelope<>(user,null, null, this, ++serviceRequestCounter, null, false, true, true, true, false, true);
      ///    asyncNetworking = new AsyncNetworking(this, this, USER_SIGNUP_TASK, true, userInfoEnvelope, Integer.class);

      if (postResponse.statusCode == 200) {
        var qaData = jsonDecode(postResponse.body);
        for (int i = 0; i < qaData.length; i++) {
          qa.add(APIQAQuery.fromJson(qaData[i]));
        }
      } else {
        log(postResponse.body);
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