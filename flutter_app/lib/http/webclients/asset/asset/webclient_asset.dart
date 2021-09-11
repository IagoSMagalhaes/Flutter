

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/asset/dto/response/response_get_asset_entity.dart';
import 'package:http/http.dart';


class WebClientAsset extends AbstractWebClient {


  Future<List<ResponseGetAssetEntity>> findAllAssets() async {
    final httpResponse = await client.get(Uri.parse(localhostBaseUrlV1))
        .timeout(Duration(seconds: 15));

    List<ResponseGetAssetEntity> responseMethod = [];

    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetAssetEntity> assets = [];

      datas.forEach((element) =>
          assets.add(ResponseGetAssetEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;
    } else {
      return [];
    }
  }

  Future<Response> post(List<RequestPostAssetEntity> assets, String password, BuildContext context) async {

    RequestPostAssetEntity asset = assets.first;

    final String body = asset.toJson();

    return client.post(Uri.parse(localhostBaseUrlV1),
                       headers:  buildHeader(password),
                       body: body)
                       .catchError((e) {FailureDialog(message: e.toString()).showDialogError(context, e);
                   }, test: (e) => e is HttpException)
                       .catchError((e) {FailureDialog(message: e.toString()).showDialogError(context, e);
                   }, test: (e) => e is TimeoutException)
                       .catchError((e) => FailureDialog().showUnknowError(context))
                       .timeout(Duration(seconds: 15));
  }
  
  
  
}
/*










  Future<Response> findAll() =>
      get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));


  Future<Test?> findById() async {
    Response httpResponse = await get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    Test responseMethod = Test(null, null, null);

    if (httpResponse.statusCode == 200) {
      dynamic datas = json.decode(httpResponse.body);

      Test jsonResponse = Test.fromJson(datas);

      responseMethod = jsonResponse;

      return responseMethod;
    } else {
      return null;
    }
  }
}






class Test {
  final int? userId;
  final int? id;
  final String? title;
  //final String? body;

  Test(this.userId, this.id, this.title);

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      json['userId'] as int?,
      json['id'] as int?,
      json['title'] as String?
    //  json['body'] as String?,
    );
  }

}

















class ResponseGetAllAsset {

  List<ResponseGetAssetEntity>? assets;

  ResponseGetAllAsset(this.assets);

}




 */