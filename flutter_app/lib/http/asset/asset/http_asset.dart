

import 'dart:convert';

import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/asset/dto/response/response_get_asset_entity.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class HttpAsset {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";
  final String localhostAssetBaseUrl = "http://localhost:8081/v1";
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);


  Future<List<ResponseGetAssetEntity>> findAllAssets() async {

    final httpResponse = await client.get(Uri.parse(localhostAssetBaseUrl)).timeout(Duration(seconds: 15));
    List<ResponseGetAssetEntity> responseMethod = [];

/*
    final Response response = await client.get('http://192.168.3.46:8080/transactions');
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<Transaction> transactions = List();
    for(Map<String, dynamic> transactionJson in decodeJson){
      final Map<String, dynamic> contactJson = transactionJson['contact'];
      final Transaction transaction = Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    return transactions;



 */


    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetAssetEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseGetAssetEntity.fromJson(element)));

      responseMethod = assets;

      print(responseMethod.first.name);

      return responseMethod;

    } else {

      return [];
    }




  }

/*
  List<Asset> findAllAssetss()  {
    final httpResponse = client.get(Uri.parse(localhostAssetBaseUrl))
        .timeout(Duration(seconds: 15));
    List<Asset> responseMethod = [];

    httpResponse.then((value) => responseMethod = value.body as List<Asset>);

    return responseMethod;
  }

 */






Future<void> post(List<RequestPostAssetEntity> assets) async {

    assets.forEach((asset) async {

      final Map<String, dynamic> assetMap = {
        'name': asset.name,
        'fullValue': asset.fullValue,
        'manager': asset.manager};

      final String assetJson = jsonEncode(assetMap);

      final httpResponse = await client.post(Uri.parse(localhostAssetBaseUrl),
                                              headers: { 'Content-type': 'application/json',
                                                         'Authorization': 'bearer UAHSUQHWEN,MANSD,'},
                                              body: assetJson)
                                        .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 200){
       // Map<String, dynamic> json = jsonDecode(httpResponse.body);
        //List<ResponseGetAssetEntity> assets = [];
        //datas.forEach((element) => assets.add(ResponseGetAssetEntity.fromJson(element)));
        //responseMethod = assets;
      }
    });

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

  List<ResponseGetAssetEntity>? assets;

  ResponseGetAllAsset(this.assets);

}


