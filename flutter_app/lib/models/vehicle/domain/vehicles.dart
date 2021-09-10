
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/asset/asset_address.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';

class Vehicle extends AbstractDomain {

  @override int? id;
  @override String? name;
  final double? fullValue;
  final String? manager;

  Vehicle(
      this.id,
      this.name,
      this.fullValue,
      this.manager,
      ) : super();

  List<RequestPostAssetEntity> toPost()  =>
      [RequestPostAssetEntity(name, "vehicle", fullValue, manager)];

}