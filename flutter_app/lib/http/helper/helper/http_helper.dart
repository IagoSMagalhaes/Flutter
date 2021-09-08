

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class HttpHelper  {

  //LIST
  bool existData(snapshot) {
    if (snapshot.hasData) {
      final List<dynamic>? response = snapshot.data;

      if (response != null && response.isNotEmpty) {
        return true;
      }
    }
    return false;
  }
}