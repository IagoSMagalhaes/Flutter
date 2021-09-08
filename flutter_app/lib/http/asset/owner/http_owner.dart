

import 'dart:convert';

import 'package:flutter_app/http/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/owner/owner.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class HttpOwner {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostAssetBaseUrl = "http://localhost:8081/owner/v1";
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  Future<List<ResponseOwnerEntity>> findAll() async {
    final httpResponse = await client.get(Uri.parse(localhostAssetBaseUrl))
        .timeout(Duration(seconds: 15));
    List<ResponseOwnerEntity> responseMethod = [];


    if (httpResponse.statusCode == 200) {

      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseOwnerEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseOwnerEntity.fromJson(element)));

      responseMethod = assets;

      print(responseMethod.first.name);

      return responseMethod;
    } else {
      return [];
    }
  }


  Future<void> post(List<RequestPostOwnerEntity> assets) async {

    assets.forEach((asset) async {

      final Map<String, dynamic> assetMap = {'name': asset.name, 'cellphone': asset.cellphone};

      final String body = jsonEncode(assetMap);

      final httpResponse = await client.post(Uri.parse(localhostAssetBaseUrl),
          headers: { 'Content-type': 'application/json',
                     'Authorization': 'bearer UAHSUQHWEN,MANSD,'},
          body: body)
                                      .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 200){
        //print("OK OWNER POST");
      }
    });
  }
}