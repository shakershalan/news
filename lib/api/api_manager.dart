import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/SourceResponse.dart';
import 'api_constents.dart';
///https://newsapi.org/v2/everything?q=bitcoin&apiKey=4802923e8a274ae8aed08a8e76767f8a
class ApiManager{
  static Future<SourceResponse?> getSources() async{
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourceUrl, {
      "apiKey": "4802923e8a274ae8aed08a8e76767f8a"
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }
  static Future<SourceResponse?> getNewsBySourceId(String sourceId) async{
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsSourceUrl, {
      "apiKey":"4802923e8a274ae8aed08a8e76767f8a",
      "sources":sourceId
    });
    try{
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return SourceResponse.fromJson(json);
    }catch(e){
      throw e;
    }

  }

}