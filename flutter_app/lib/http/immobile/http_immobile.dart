

import 'dart:convert';

import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/immobiles/dto/response/response_get_immobile_entity.dart';
import 'package:flutter_app/models/vehicles/dto/response/response_get_vehicles_entity.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class HttpImmobile {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostImmobileBaseUrl = "http://localhost:8081/v1";
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  Future<List<ResponseGetImmobileEntity>> findAll() async {

    final httpResponse = await client.get(Uri.parse(localhostImmobileBaseUrl)).timeout(Duration(seconds: 15));
    List<ResponseGetImmobileEntity> responseMethod = [];


    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetImmobileEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseGetImmobileEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;

    } else {

      return [];
    }


  }
}