

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/components/component_response_dialog.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/user/dto/request/request_post_user.dart';
import 'package:flutter_app/models/user/dto/response/response_get_user_entity.dart';
import 'package:http/http.dart';


class WebClientUser extends AbstractWebClient {

  final _urlUser = "user/v1";

  Future<List<ResponseGetUserEntity>> findAll() async {
    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlUser))
        .timeout(Duration(seconds: 15));
    List<ResponseGetUserEntity> responseMethod = [];

    if (httpResponse.statusCode == 200) {

      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetUserEntity> users = [];

      datas.forEach((element) => users.add(ResponseGetUserEntity.fromJson(element)));

      responseMethod = users;

      return responseMethod;
    } else {
      return [];
    }
  }

  Future<Response> post(List<RequestPostUserEntity> assets, String password, BuildContext context) async {

    RequestPostUserEntity user = assets.first;

      final String body = user.toJson();

      return client.post(Uri.parse(localhostBaseUrl + _urlUser),
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