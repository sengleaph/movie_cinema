import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../handle_error/app_exception.dart';

class NetworkApiService {
  dynamic responseJson;

  Future<dynamic> getApiResponse(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }
}

returnResponse(http.Response response) {
  // print('response status : ${response.statusCode}');
  switch (response.statusCode) {
    case 200:
      print('response :: ${response.body}');
      return jsonDecode(response.body);
    case 400:
      throw FetchDataException('No internet connection');
  }
}
