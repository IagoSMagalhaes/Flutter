import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/owner/domain/owner.dart';
import 'package:flutter_app/screens/owner/screens_owners_list_all.dart';

class ResponseOwnerEntity extends AbstractResponse {
  final int? id;
  final String? name;
  final String? cellphone;

  ResponseOwnerEntity(this.id, this.name, this.cellphone);

  factory ResponseOwnerEntity.fromJson(Map<String, dynamic> json) {
    return ResponseOwnerEntity(json['id'], json['name'], json['cellphone']);
  }

  OwnerItemList toOwnerItem() {
    final Owner ownerSave = Owner(id, name, cellphone);

    return OwnerItemList(ownerSave);
  }

  @override
  AbstractItem toItem() =>
      OwnerAbstractItem(name, cellphone, Icon(Icons.contact_phone));
}



class OwnerAbstractItemList extends AbstractItemList {

  final title = "title";

  OwnerAbstractItemList() : super(item: OwnerAbstractItem("", "", Icon(Icons.monetization_on)));

  @override get icon => Icon(Icons.add);

}


class OwnerAbstractItem extends AbstractItem {

  OwnerAbstractItem(String? title, String? subTitle, Icon? icon) : super(title, subTitle, icon);
}


