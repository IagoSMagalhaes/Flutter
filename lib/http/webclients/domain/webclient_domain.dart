

import 'dart:convert';

import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/domain/dto/response/model_response_get_domain_entity.dart';



class WebClientDomain extends AbstractWebClient {


  final _urlDomain = "domain/v1";

  Future<List<ResponseGetDomainEntity>> get(String domain) async {
    final httpResponse = await client.get(
        Uri.parse(localhostBaseUrl + _urlDomain),
        headers: {'domain': domain})
        .timeout(Duration(seconds: 15));

    List<ResponseGetDomainEntity> responseMethod = [];

    if (httpResponse.statusCode == 200) {
      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetDomainEntity> assets = [];

      datas.forEach((element) =>
          assets.add(ResponseGetDomainEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;
    } else {
      return [];
    }
  }

    Future<List<String>> getOptions(String keyDomain) async {

      List<String> options = [];

      final httpResponse = await get(keyDomain);

      httpResponse.forEach((element) {
        options.add(element.label!);
      });

      return options;


  }


}