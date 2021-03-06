


import 'dart:io';

import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'webclient_helper.dart';

class AbstractWebClient {

  final String localhostBaseUrl = "http://localhost:8081/";
  final String localhostBaseUrlV1 = "http://localhost:8081/v1";

  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  WebClientHelper httpHelper = WebClientHelper();


  Map<String, String> buildHeader(String password) => {
    'Content-type': 'application/json',
    'Authorization': password};

  Map<String, String> buildHeaderById(int id) => {
    'Content-type': 'application/json',
    'id': id.toString()};

  Map<String, String> buildHeaderByIdAsset(int? id) => {
    'Content-type': 'application/json',
    'idAsset': id.toString()};

  Map<String, String> buildHeaderNoAutenticate() => { 'Content-type': 'application/json'};

  void genericThrowHttpError(int codeResponse) => throw HttpException(getMessage(codeResponse));

  String getMessage(int codeResponse)  {
    return _statusCodeResponse[codeResponse].toString();
}

  static final Map<int, String> _statusCodeResponse = {
    400 : "Erro ao submterer requisição",
    404 : "Path não encontrado",
    401 : "Erro de autenticação",
    500 : "Erro interno do servidor"
  };
}



class ApiError{

  final int? httpStatusCode;
  final String? codeMessage;
  final String? message;

  ApiError(this.httpStatusCode, this.codeMessage, this.message);

  factory ApiError.fromJson(Map<String, dynamic> json) {

    return ApiError(
        json['httpStatusCode'],
        json['codeMessage'],
        json['message']);
  }
}