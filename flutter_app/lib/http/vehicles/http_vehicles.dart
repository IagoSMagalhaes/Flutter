

import 'dart:convert';

import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/asset/dto/response/response_get_asset_entity.dart';
import 'package:flutter_app/models/vehicles/dto/response/response_get_vehicles_entity.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class HttpVehicles {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostVehiclesBaseUrl = "http://localhost:8081/vehicle/v1";
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  Future<List<ResponseGetVehicleEntity>> findAll() async {

    final httpResponse = await client.get(Uri.parse(localhostVehiclesBaseUrl)).timeout(Duration(seconds: 15));
    List<ResponseGetVehicleEntity> responseMethod = [];


    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetVehicleEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseGetVehicleEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;

    } else {

      return [];
    }


  }
}