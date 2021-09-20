
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_detail.dart';


class ResponseGetDomainEntity extends AbstractResponse{

  final String? label;
  final String? value;

  ResponseGetDomainEntity(this.label, this.value);

  factory ResponseGetDomainEntity.fromJson(Map<String, dynamic> json) {

    return ResponseGetDomainEntity(
        json['label'],
        json['value']);
  }

  void onClick(context) => RouterFactory().navigateTo(context, ScreenUserImageDetail(1));

  @override
  AbstractItem toItem() => DomainAbstractItem(null, null, null, null, null);

  

}

class DomainAbstractItemList extends AbstractItemList {

  final title = "title";

  DomainAbstractItemList() : super(item: DomainAbstractItem(null, "", "", Icon(Icons.car_repair), null));

  @override get icon => Icon(Icons.add);

}


class DomainAbstractItem extends AbstractItem {

  DomainAbstractItem(int? id, String? title, String? subTitle, Icon? icon, StatefulWidget? onClickNavigateTo) : super(id, title, subTitle, icon, onClickNavigateTo);
}