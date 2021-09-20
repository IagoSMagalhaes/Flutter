
import 'package:flutter/material.dart';
import 'package:flutter_app/components/gridView/list_view_image_component.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_detail.dart';

class ResponseGetUserImageEntity extends AbstractResponse{

  final int? id;
  final String? fullName;
  final String? district;
  final String? street;
  final String? number;
  final String? postalCode;

  ResponseGetUserImageEntity(this.id, this.fullName, this.district, this.street, this.number, this.postalCode);

  factory ResponseGetUserImageEntity.fromJson(Map<String, dynamic> json) {

    return ResponseGetUserImageEntity(
        json['id'],
        json['fullName'],
        json['district'],
        json['street'],
        json['number'],
        json['postalCode']
    );
  }



  @override
  AbstractItem toItem() => UserImageAbstractItem(id, fullName, district, Icon(Icons.home), ScreenUserImageDetail(id));

  toItemImage() => AbstractItemListView(id, fullName, district, "http://localhost:8081/immobile/v1/image/" + id.toString(), ScreenUserImageDetail(id));

  

}
/*
class UserImageAbstractItemList extends AbstractItemList {

  final title = "title";

  UserImageAbstractItemList() : super(item: UserImageAbstractItem("", "", Icon(Icons.car_repair), (){}));

  void onClick(context) => RouterFactory().navigateTo(context, ScreenUserImageDetail());

  //UserImageAbstractItemList() : super(item: UserImageAbstractItem("", "", Icon(Icons.car_repair), onClick(context)));

  //UserImageAbstractItemList(context) : super(item: UserImageAbstractItem("", "", Icon(Icons.car_repair), onClick(context)));

  @override get icon => Icon(Icons.add);

}

 */


class UserImageAbstractItem extends AbstractItem {

  UserImageAbstractItem(int? id, String? title, String? subTitle, Icon? icon, StatefulWidget? onClickNavigateTo) : super(id, title, subTitle, icon, onClickNavigateTo);
}