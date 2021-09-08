
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';

class ResponseGetImmobileEntity extends AbstractResponse{

  final int? id;
  final String? name;
  final String? manager;

  ResponseGetImmobileEntity(this.id, this.name, this.manager);

  factory ResponseGetImmobileEntity.fromJson(Map<String, dynamic> json) {

    return ResponseGetImmobileEntity(
        json['id'],
        json['name'],
        json['manager']);
  }

  @override
  AbstractItem toItem() => ImmobileAbstractItem(name, manager, Icon(Icons.home));

  

}

class ImmobileAbstractItemList extends AbstractItemList {

  final title = "title";

  ImmobileAbstractItemList() : super(item: ImmobileAbstractItem("", "", Icon(Icons.car_repair)));

  @override get icon => Icon(Icons.add);

}


class ImmobileAbstractItem extends AbstractItem {

  ImmobileAbstractItem(String? title, String? subTitle, Icon? icon) : super(title, subTitle, icon);
}