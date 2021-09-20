

import 'dart:convert';

import 'package:flutter_app/components/gridView/list_view_image_component.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/user/dto/request/request_post_user.dart';
import 'package:flutter_app/models/userImage/dto/response/response_get_immobile_entity.dart';




class WebClientUserImage extends AbstractWebClient {


  final _urlUserImage = "userImage/v1";
  final _urlUserImageAndImage = "userImage/v1/image";
  final _urlUserImageGetById = "userImage/v1/detail";

  Future<List<ResponseGetUserImageEntity>> get() async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlUserImage)).timeout(Duration(seconds: 15));

    List<ResponseGetUserImageEntity> responseMethod = [];


    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetUserImageEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseGetUserImageEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;

    } else {

      return [];
    }
  }

  List<AbstractItemListView> getAllAndImage() {

    List<AbstractItemListView> response = [];

    final httpResponse = client.get(Uri.parse(localhostBaseUrl + _urlUserImage)).timeout(Duration(seconds: 15));

    httpResponse.then((value) {

      List<dynamic> datas = json.decode(value.body);

        datas.forEach((element) => response.add(ResponseGetUserImageEntity.fromJson(element).toItemImage()));

   // responseMethod = assets;
    });

    return response;
  }

  Future<ResponseGetUserImageEntity?> getById(int id) async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlUserImageGetById),
                                          headers:  buildHeaderById(id),)
                                     .timeout(Duration(seconds: 15));

    if (httpResponse.statusCode == 200) {
      dynamic datas = json.decode(httpResponse.body);
      return ResponseGetUserImageEntity.fromJson(datas);
    } else {

      return null;
    }
  }


/*
  Future<List<String>> getOptions(String keyDomain) async {

    List<String> options = [];

    final httpResponse = await get();

    httpResponse.forEach((element) {
    //  options.add(element.label!);
    });

    return options;


  }

 */


  Future<void> post(List<RequestPostUserEntity> userImages, String password) async {

    userImages.forEach((userImage) async {

      final String body = userImage.toJson();

      final httpResponse = await client.post(Uri.parse(localhostBaseUrl + _urlUserImage),
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