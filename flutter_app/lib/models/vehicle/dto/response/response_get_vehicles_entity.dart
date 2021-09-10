
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';

class ResponseGetVehicleEntity extends AbstractResponse{

  final int? id;
  final String? name;
  final String? manager;

  ResponseGetVehicleEntity(this.id, this.name, this.manager);

  factory ResponseGetVehicleEntity.fromJson(Map<String, dynamic> json) {

    return ResponseGetVehicleEntity(
        json['id'],
        json['name'],
        json['manager']);
  }

  @override
  AbstractItem toItem() => VehicleAbstractItem(name, manager, Icon(Icons.car_repair));

  

}

class VehicleAbstractItemList extends AbstractItemList {

  final title = "title";

  VehicleAbstractItemList() : super(item: VehicleAbstractItem("", "", Icon(Icons.car_repair)));

  @override get icon => Icon(Icons.add);

}


class VehicleAbstractItem extends AbstractItem {

  VehicleAbstractItem(String? title, String? subTitle, Icon? icon) : super(title, subTitle, icon);
}