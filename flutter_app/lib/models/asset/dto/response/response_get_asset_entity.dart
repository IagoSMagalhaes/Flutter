
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';

class ResponseGetAssetEntity extends AbstractResponse{

  final int? id;
  final String? name;
  final String? manager;

  ResponseGetAssetEntity(this.id, this.name, this.manager);

  factory ResponseGetAssetEntity.fromJson(Map<String, dynamic> json) {

    return ResponseGetAssetEntity(
        json['id'],
        json['name'],
        json['manager']);
  }

  @override
  AbstractItem toItem() => AssetAbstractItem(name, manager, Icon(Icons.monetization_on));

  

}

class AssetAbstractItemList extends AbstractItemList {

  final title = "title";

  AssetAbstractItemList() : super(item: AssetAbstractItem("", "", Icon(Icons.monetization_on)));

  @override get icon => Icon(Icons.add);

}


class AssetAbstractItem extends AbstractItem {

  AssetAbstractItem(String? title, String? subTitle, Icon? icon) : super(title, subTitle, icon);
}