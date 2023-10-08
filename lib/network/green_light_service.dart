import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled/constants.dart';
//import 'package:http/http.dart';
import 'package:untitled/data/QuestionsAndAnswers.dart';
import 'package:untitled/network/qa_model.dart';

const String apiKey = '<Your Key>';
const String apiId = '<your ID>';
const String apiUrl = 'localhost:44358';// /qa/GetAllQAs';

class GreenLightService {
  late Response response;

  //bool error = false; //for error status
  bool loading = false; //for data fetching status
  //String errmsg = ""; //to accessing any error message from API/runtime
  var apidata; //for decoded JSON data
  bool refresh = false; //for forcing refreshing cache

  Future<List<APIQAQuery>> getDataDio() async {
    List<APIQAQuery> qa = [];
    try {

      //var headers = {
      //  "Access-Control-Allow-Origin": "*",
       // 'Content-Type': 'application/json',
      //  'Accept': '#/*'
      //};
      Dio dio = Dio(/*BaseOptions(headers: headers)*/);
      dio.options.headers["Access-Control-Allow-Origin"] = "*";
      dio.options.headers["Access-Control-Allow-Credentials"] = true;
      dio.options.headers["Access-Control-Allow-Headers"] =
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
      dio.options.headers["Access-Control-Allow-Methods"] =
      "GET, HEAD, POST, OPTIONS";
      Response response = await dio.get(
          Constants.apiUrl, options: buildCacheOptions(

        const Duration(days: 7), //duration of cache
        forceRefresh: refresh, //to force refresh
        maxStale: const Duration(days: 10), //before this time, if error like
        //500, 500 happens, it will return cache
      ));

      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 200) {
        //fetch successful
        var qaData = jsonDecode(response.data);
        for (int i = 0; i < qaData.length; i++) {
          qa.add(APIQAQuery.fromJson(qaData[i]));
        }
      } else {
        throw Exception("Error while fetching data.");
      }
      loading = false;
      refresh = false;
    }
    on Exception catch(e){
      print(e);
    }return qa;
  }
}

