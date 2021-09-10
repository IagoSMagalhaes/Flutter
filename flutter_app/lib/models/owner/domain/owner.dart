
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