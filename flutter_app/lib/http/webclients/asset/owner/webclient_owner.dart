

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/http/helper/interceptor/http_interceptor.dart';
import 'package:flutter_app/models/owner/dto/request/request_post_owner.dart';
import 'package:flutter_app/models/owner/dto/response/response_get_owner_entity.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';


class WebClientOwner extends AbstractWebClient {

  final _urlOwner = "owner/v1";
  final _messageExceptionPost = "owner/v1";

  Future<List<ResponseOwnerEntity>> findAll() async {
    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlOwner))
        .timeout(Duration(seconds: 15));
    List<ResponseOwnerEntity> responseMethod = [];


    print("httpResponse.statusCode");
    print(httpResponse.statusCode);
    if (httpResponse.statusCode == 200) {

      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseOwnerEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseOwnerEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;
    } else {
      return [];
    }
  }

  //Future<void> post(List<RequestPostOwnerEntity> assets, String password, BuildContext context) async {
  //post(List<RequestPostOwnerEntity> assets, String password, BuildContext context) async {
  post(List<RequestPostOwnerEntity> assets, String password, BuildContext context) {

    assets.forEach((asset) async {

      final String body = asset.toJson();

      final httpResponse = await client.post(Uri.parse(localhostBaseUrl + _urlOwner),
                                        headers:  buildHeader(password),
                                        body: body)
                                       .catchError((e) => FailureDialog(e.toString()).showUnknowError(context))
                                       .catchError((e) {FailureDialog(e.toString()).showDialogError(context, e);
                                            }, test: (e) => e is HttpException)
                                       .catchError((e) {FailureDialog(e.toString()).showDialogError(context, e);
                                          }, test: (e) => e is TimeoutException)
                                       .catchError((e) {FailureDialog(e.toString()).showUnknowError(context);})
                                       .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 200){
        await SuccessDialog("salvo com sucesso").showDialogSuccess(context);
      } else {

        ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));

        FailureDialog(apiError.message!).showDialogErrorMessage(context);

      }
    });
  }
}