

import 'dart:convert';

import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/models/payments/dto/request/model_response_get_payments_entity.dart';



class WebClientPayment extends AbstractWebClient {

  final _urlPaymentGetById = "payment/v1";


  Future<ResponseGetPaymentDetailEntity?> getById(int? id) async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlPaymentGetById),
                                          headers:  buildHeaderByIdAsset(id),)
                                     .timeout(Duration(seconds: 15));


    if (httpResponse.statusCode == 200) {
      dynamic datas = json.decode(httpResponse.body);

      return ResponseGetPaymentDetailEntity.fromJson(datas);
    } else {
      return null;
    }
  }



}