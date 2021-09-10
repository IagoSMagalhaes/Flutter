

import 'dart:convert';

import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/immobile/dto/request/request_post_immobile_entity.dart';
import 'package:flutter_app/models/immobile/dto/response/response_get_immobile_entity.dart';



class WebClientImmobile extends AbstractWebClient {


  final _urlImmobile = "immobile/v1";

  Future<List<ResponseGetImmobileEntity>> findAll() async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlImmobile)).timeout(Duration(seconds: 15));

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


  Future<void> post(List<RequestPostImmobileEntity> immobiles, String password) async {

    immobiles.forEach((immobile) async {

      final String body = immobile.toJson();

      final httpResponse = await client.post(Uri.parse(localhostBaseUrl + _urlImmobile),
                                                  headers:  buildHeader(password),
                                                  body: body)
                                                  .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 200){
        return;
      } else {
        genericThrowHttpError(httpResponse.statusCode);
      }

    });

  }



}