import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'package:untitled/data/lecture_dto.dart';
import 'package:untitled/data/simple_request.dart';
import 'package:untitled/network/envelope.dart';
import 'package:untitled/data/APILecturesQuery.dart';
import 'package:untitled/utilities/settings.dart';
import "package:untitled/data/api_lecture_search_criterias.dart";

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';

//const String apiUrl = 'localhost:44358';// /qa/GetAllQAs';
abstract class SerializableClass {
  SerializableClass fromJson(Map<String, dynamic> json);
}

class LecturesRepository<T> /*extends SerializableClass*/ {
  static int serviceRequestCounter = 0;
  Future<List<APILecturesQuery>> getLecturesSimple(String url) async {
    List<APILecturesQuery> lectures = [];
    try {
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };
      SimpleRequest simpleRequest = SimpleRequest(-1, "fa-IR");
      LectureSearchCriterias? searchCriterias = LectureSearchCriterias();
      Envelope envelope = Envelope<SimpleRequest, LectureSearchCriterias>(
          simpleRequest,
          searchCriterias,
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

      Map<String, dynamic> json = envelope.ToJson(
          (data) => simpleRequest.toJson(data),
          (searchCriteriaData) => searchCriterias.toJson());

      final postResponse = await post(Uri.https(Settings.baseUrl, url),
          headers: headers, body: jsonEncode(json));

      if (postResponse.statusCode == 200) {
        var qaData = jsonDecode(postResponse.body);
        for (int i = 0; i < qaData.length; i++) {
          lectures.add(APILecturesQuery.fromJson(qaData[i]));
        }
      } else {
        log(postResponse.body);
      }
    } catch (e) {
      print(e);
    }
    return lectures;
  }

  Future<List<LectureDto>> getLectures(
      String url, LectureDto request, LectureSearchCriterias searchCriterias,
      {LectureDto? sortCriterias,
      int from = 0,
      int pageCount = 100,
      bool isShuffled = false}) async {
    List<LectureDto> lectures = [];
    try {
      var headers = {
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
        'Accept': '*/*'
      };

      Envelope<LectureDto, LectureSearchCriterias> envelope =
          Envelope<LectureDto, LectureSearchCriterias>(
              request,
              searchCriterias,
              sortCriterias,
              Settings.locale,
              from,
              pageCount,
              isShuffled,
              ++serviceRequestCounter,
              null,
              false,
              false,
              false,
              false,
              false,
              false,
              '');
      Map<String, dynamic> json = envelope.ToJson(
          (data) => request.toJson(), (data2) => searchCriterias.toJson());

      final postResponse = await post(Uri.https(Settings.baseUrl, url),
          headers: headers, body: jsonEncode(json));

      if (postResponse.statusCode == 200) {
        var qaData = jsonDecode(postResponse.body);
        for (int i = 0; i < qaData.length; i++) {
          lectures.add(LectureDto.fromJson(qaData[i]));
        }
      } else {
        log(postResponse.body);
      }
    } catch (e) {
      print(e);
    }
    return lectures;
  }

  //  T? fromJson(T? proto, Map<String, dynamic> json) =>
  //      proto!.fromJson(json) as T?;
  // Future<List<T?>> getList(String url,APILectureSearchCriterias searchCriterias) async {
  //   List<T?> list = [];
  //   try {
  //     var headers = {
  //       "Access-Control-Allow-Origin": "*",
  //       'Content-Type': 'application/json',
  //       'Accept': '*/*'
  //     };
  //     //final response = await get(Uri.https(url,'lecture/GetAllLectures'),headers: headers);
  //     SimpleRequest simpleRequest = SimpleRequest(-1, "fa-IR");
  //     Envelope<SimpleRequest, APILectureSearchCriterias> envelope = Envelope(
  //         simpleRequest,
  //         searchCriterias,
  //         null,
  //         null,
  //         null,
  //         false,
  //         ++serviceRequestCounter,
  //         null,
  //         false,
  //         false,
  //         false,
  //         false,
  //         false,
  //         false,
  //         '');
  //     final postResponse =
  //         await post(Uri.https(Constants.baseUrl, url), //'lecture/GetLectures'
  //             headers: headers,
  //             body: jsonEncode(
  //               envelope.ToJson((data) => simpleRequest.toJson(data),(data2) => searchCriterias.toJson()),
  //             ));

  //     if (postResponse.statusCode == 200) {
  //       var responseBody = jsonDecode(postResponse.body);
  //       T? t = null;
  //       for (int i = 0; i < responseBody.length; i++) {
  //         list.add(
  //             fromJson(t, responseBody[i])); // T.fromJson(responseBody[i]));
  //       }
  //     } else {
  //       log(postResponse.body);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return list;
  // }
}
