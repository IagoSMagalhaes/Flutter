

import 'dart:convert';

import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/immobiles/dto/request/request_post_immobile_entity.dart';
import 'package:flutter_app/models/immobiles/dto/response/response_get_immobile_entity.dart';
import 'package:flutter_app/models/vehicles/dto/response/response_get_vehicles_entity.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class WebClientImmobile {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostImmobileBaseUrl = "http://localhost:8081/immobile/v1";
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


  Future<void> post(List<RequestPostImmobileEntity> body, String password) async {

    body.forEach((immobile) async {

      final String assetJson = immobile.toJson();

      final httpResponse = await client.post(Uri.parse(localhostImmobileBaseUrl),
          headers: { 'Content-type': 'application/json',
                     'Authorization': password},
          body: assetJson)
          .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 400){
        throw Exception("Erro para salvar o imóvel");
      }

      if(httpResponse.statusCode == 500){
        throw Exception("Erro na API para salvar o imóvel");
      }

      if(httpResponse.statusCode == 401){
        throw Exception("Erro de autenticação");
      }

      if(httpResponse.statusCode == 200){
        // Map<String, dynamic> json = jsonDecode(httpResponse.body);
        //List<ResponseGetAssetEntity> assets = [];
        //datas.forEach((element) => assets.add(ResponseGetAssetEntity.fromJson(element)));
        //responseMethod = assets;
      }

    });

  }
}