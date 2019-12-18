import 'dart:convert';

import 'package:project_boilerplate/utils/logger.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  final String baseURL;

  NetworkHandler({this.baseURL});

  Future<Map<String, String>> get defaultHeaders async{
    //String token = await TokenManager.instance.getToken();
    //appLog.i("API Header token: $token");
    return {
      //"Authorization": "Bearer $token",
      "Content-Type": "application/json"
    };
  }

  dynamic formatResponse(dynamic data) {
    return data;
  }

  dynamic extractResponse(dynamic response) {
    response = response as http.Response;
    if (response.statusCode >= 400) {
      appLog.e("Response ${response.statusCode}");
      throw response;
    }
    try {
      appLog.i("Response Code ${response.statusCode} ${response.body}");
      return formatResponse(json.decode(response.body));
    } catch (e) {
      appLog.wtf("Response Bad format ${response.body}");
      return response.body;
    }
  }

  formatURL(String url, {String method: ''}) {
    assert(!url.startsWith("/"));
    return baseURL + url;
  }

  Future<dynamic> get(String url, {Map<String, String> additionalheaders}) async {
    url = this.formatURL(url);
    Map<String, String> headers = await defaultHeaders;
    if (additionalheaders != null) {
      headers.addAll(additionalheaders);
    }

    appLog.d("GET $url");
    http.Response r = await http.get(
      url,
      headers: headers,
    );
    return this.extractResponse(r);
  }

  Future<dynamic> post(String url, Map data) async {
    url = this.formatURL(url);
    Map<String, String> headers = await defaultHeaders;
    appLog.d("POST $url with data $data");
    http.Response r = await http.post(
      url,
      body: json.encode(data),
      headers: headers
    );
    return this.extractResponse(r);
  }

  Future<dynamic> put(
    String url,
    Map data,
  ) async {
    url = this.formatURL(url);
    Map<String, String> headers = await defaultHeaders;
    appLog.d("PUT $url with data $data");
    http.Response r = await http.put(
      url,
      body: json.encode(data),
      headers: headers
    );
    return this.extractResponse(r);
  }

  Future<dynamic> delete(String url) async {
    url = this.formatURL(url);
    Map<String, String> headers = await defaultHeaders;
    appLog.d("DELETE $url");
    http.Response r = await http.delete(
      url,
      headers: headers
    );
    return this.extractResponse(r);
  }
}
