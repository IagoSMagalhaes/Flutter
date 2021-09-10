

import 'dart:convert';

import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/vehicle/dto/request/request_post_vehicle_entity.dart';
import 'package:flutter_app/models/vehicle/dto/response/response_get_vehicles_entity.dart';


class WebClientVehicles extends AbstractWebClient{

  final _urlVehicle = "vehicle/v1";

  Future<List<ResponseGetVehicleEntity>> findAll() async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlVehicle)).timeout(Duration(seconds: 15));

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

  Future<void> post(List<RequestPostVehicleEntity> vehicles, String password) async {

    vehicles.forEach((vehicle) async {

      final String body = vehicle.toJson();

      final httpResponse = await client.post(Uri.parse(localhostBaseUrl + _urlVehicle),
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