
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';


class ResponseGetPaymentDetailEntity {

  int? idAsset;
  int? idOwner;
  final List<GetPaymentDetailEntity>? paymentsDetail;

  ResponseGetPaymentDetailEntity(this.idAsset, this.idOwner, this.paymentsDetail);

  factory ResponseGetPaymentDetailEntity.fromJson(Map<String, dynamic> json) {

    var listPaymentDetail = json['paymentsDetail'] as List;

    List<GetPaymentDetailEntity> payments = [];

    listPaymentDetail.forEach((element) {
      payments.add(GetPaymentDetailEntity.fromJson(element));
    });

    return ResponseGetPaymentDetailEntity(
        json['idAsset'],
        json['idOwner'],
        payments);

  }


  //@override
  //AbstractItem toItem() => ImmobileAbstractItem(id, name, manager, Icon(Icons.home), ScreenUserImageDetail(id));

}

class GetPaymentDetailEntity {

  final String? namePayer;
  final int? value;
  //final String? dateVenciment;
  final String? status;
  final String? description;

  GetPaymentDetailEntity(this.namePayer, this.value, this.status, this.description);

  factory GetPaymentDetailEntity.fromJson(Map<String, dynamic> json) {

    return GetPaymentDetailEntity(
        json['namePayer'],
        json['value'],
        json['status'],
        null);

  }
}

/*
class ImmobileAbstractItemList extends AbstractItemList {

  final title = "title";

  ImmobileAbstractItemList() : super(item: ImmobileAbstractItem("", "", Icon(Icons.car_repair), (){}));

  void onClick(context) => RouterFactory().navigateTo(context, ScreenUserImageDetail());

  //ImmobileAbstractItemList() : super(item: ImmobileAbstractItem("", "", Icon(Icons.car_repair), onClick(context)));

  //ImmobileAbstractItemList(context) : super(item: ImmobileAbstractItem("", "", Icon(Icons.car_repair), onClick(context)));

  @override get icon => Icon(Icons.add);

}

 */


class ImmobileAbstractItem extends AbstractItem {

  ImmobileAbstractItem(int? id, String? title, String? subTitle, Icon? icon, StatefulWidget? onClickNavigateTo) : super(id, title, subTitle, icon, onClickNavigateTo);
}