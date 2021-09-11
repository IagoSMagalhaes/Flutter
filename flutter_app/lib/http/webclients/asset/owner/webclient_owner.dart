

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

  Future<List<ResponseOwnerEntity>> findAll() async {
    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlOwner))
        .timeout(Duration(seconds: 15));
    List<ResponseOwnerEntity> responseMethod = [];


    print("httpResponse.statusCode");
    print(httpResponse.statusCode);
    if (httpResponse.statusCode == 200) {

      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseOwnerEntity> owners = [];

      datas.forEach((element) => owners.add(ResponseOwnerEntity.fromJson(element)));

      responseMethod = owners;

      return responseMethod;
    } else {
      return [];
    }
  }

  Future<Response> post(List<RequestPostOwnerEntity> assets, String password, BuildContext context) async {

    RequestPostOwnerEntity owner = assets.first;

      final String body = owner.toJson();

      return client.post(Uri.parse(localhostBaseUrl + _urlOwner),
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