import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';



class ApiRequestClient extends GetxService{

  static var client = http.Client();

  static const String serverError = 'Server Error';
  static const String noInternet = 'No Internet';
  static const int timeoutInSeconds = 30;


  static Future<Response> postApiRequest(String url, String? body, {Map<String, String>? headers}) async {

    var mainHeaders = {
      'Content-Type': 'application/json',
      'Authorization':""
      //'Bearer ${ServiceController.userData?.Token}'
    };
    var urls = url;
    try {
      http.Response response = await client
          .post(
        Uri.parse(urls),
        body: body,
        headers: headers ?? mainHeaders,
      )
          .timeout(const Duration(seconds: timeoutInSeconds));
      return handleResponse(response, url);
    } on SocketException {
      return const Response(statusCode: 0, statusText: noInternet);
    } catch (e) {
      return const Response(statusCode: 1, statusText: serverError);
    }
  }

  static Response handleResponse(http.Response response, String uri) {

    Response response0 = Response(
      body: response.body ,
      request: Request(
          headers: response.request!.headers,
          method: response.request!.method,
          url: response.request!.url),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode == 200 ) {
      response0 = Response(
        statusCode: response0.statusCode,
        body: response0.body,
      );
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = const Response(statusCode: 0, statusText: noInternet);
    } else {
      response0 = const Response(statusCode: 1, statusText: serverError);
    }
    debugPrint('====> API Response: [${response0.statusCode}] $uri\n${response0.body}');
    return response0;
  }




}