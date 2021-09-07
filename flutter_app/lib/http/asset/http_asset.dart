

import 'dart:io';

import 'package:flutter_app/models/asset.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart';

class HttpAsset {

  final String postsURL = "https://jsonplaceholder.typicode.com/todos";

  Future<Response> findAll() => get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));


  Future<Test?> findById() async {

    //Future<Response> httpResponse = get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    Response httpResponse = await get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

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

/*
  Future<List<Test>> findAll() async {

    Uri uri = Uri(path: postsURL);

    Response response = await get(uri);
    print("response.body");
    print(response.body);
    print("response.statusCode");

    print(response.statusCode);

    if (response.statusCode == 200) {

      Map data = json.decode(response.body);

      final test = (data['results'] as List).map((i) => new Test.fromJson(i));

      return test.toList();

    } else {
      return [];
    }



 */

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

