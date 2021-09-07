

import 'dart:convert';

import 'package:http/http.dart';

class HttpAsset {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostGetAllAsset = "http://localhost:8081/v1";

  Future<ResponseGetAllAsset?> findAllAssets() async {
    final httpResponse = await get(Uri.parse(localhostGetAllAsset));

    ResponseGetAllAsset responseMethod = ResponseGetAllAsset([]);

    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseAssetEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseAssetEntity.fromJson(element)));

      responseMethod.assets = assets;

      print(responseMethod.assets?.first.name);

      return responseMethod;
    } else {

      return null;

    }
  }















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

  List<ResponseAssetEntity>? assets;

  ResponseGetAllAsset(this.assets);

}



class ResponseAssetEntity {

  final int? id;
  final String? name;

  ResponseAssetEntity(this.id, this.name);

  factory ResponseAssetEntity.fromJson(Map<String, dynamic> json) {

  return ResponseAssetEntity(
            json['id'],
            json['name']);
  }
}

