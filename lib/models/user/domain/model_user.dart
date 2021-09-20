
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';
import 'package:flutter_app/models/user/dto/request/request_post_user.dart';

class User extends AbstractDomain {

  @override int? id;
  @override String? name;
  final String? cellphone;


  User(
    this.id,
    this.name,
    this.cellphone,
  ) : super();

  List<RequestPostUserEntity> toPost()  =>
      [RequestPostUserEntity(name, cellphone)];



}



class UserItemList extends StatelessWidget {

  final User owner;

  UserItemList(this.owner);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: buildTitle(),
        subtitle: buildSubTitle(),
      ),
    );
  }

  Text buildSubTitle() {
    return Text(
      owner.cellphone.toString(),
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Text buildTitle() {
    return Text(
      owner.name!,
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}