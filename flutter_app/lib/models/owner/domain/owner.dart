
import 'package:flutter/material.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/owner/dto/request/request_post_owner.dart';

class Owner extends AbstractDomain {

  @override int? id;
  @override String? name;
  final String? cellphone;


  Owner(
    this.id,
    this.name,
    this.cellphone,
  ) : super();

  List<RequestPostOwnerEntity> toPost()  =>
      [RequestPostOwnerEntity(name, cellphone)];



}



class OwnerItemList extends StatelessWidget {

  final Owner owner;

  OwnerItemList(this.owner);

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