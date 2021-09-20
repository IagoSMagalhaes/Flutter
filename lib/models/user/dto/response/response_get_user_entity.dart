import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';
import 'package:flutter_app/models/user/domain/model_user.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_detail.dart';


class ResponseGetUserEntity extends AbstractResponse {
  final int? id;
  final String? name;
  final String? cellphone;

  ResponseGetUserEntity(this.id, this.name, this.cellphone);

  factory ResponseGetUserEntity.fromJson(Map<String, dynamic> json) {
    return ResponseGetUserEntity(json['id'], json['name'], json['cellphone']);
  }

  UserItemList toUserItem() {
    final User ownerSave = User(id, name, cellphone);

    return UserItemList(ownerSave);
  }

  @override
  AbstractItem toItem() =>
      UserAbstractItem(id, name, cellphone, Icon(Icons.contact_phone), ScreenUserImageDetail(id));
}



class OwnerAbstractItemList extends AbstractItemList {

  final title = "title";

  OwnerAbstractItemList() : super(item: UserAbstractItem(null, "", "", Icon(Icons.monetization_on), null));

  @override get icon => Icon(Icons.add);

}


class UserAbstractItem extends AbstractItem {

  UserAbstractItem(int? id, String? title, String? subTitle, Icon? icon, StatefulWidget? onClickNavigateTo) : super(id, title, subTitle, icon, onClickNavigateTo);
}


