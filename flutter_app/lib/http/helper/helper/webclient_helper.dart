

import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class WebClientHelper  {

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

  void genericThrowHttpError(int httpResponse) => throw Exception(_statusCodeResponse[httpResponse]);



  static final Map<int, String> _statusCodeResponse = {
    400 : "Erro ao submter a requisição",
    401 : "Erro de autenticação",
    500 : "Erro interno do servidor"
  };
}


