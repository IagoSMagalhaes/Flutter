
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';

class Immobile extends AbstractDomain {

  @override int? id;
  @override String? name;
  final AssetType? type;
  final OperationType? operationType;
  final double? fullValue;
  //final double? currentValue;
  // final Address? address;
  final String? manager;

  Immobile(
      this.id,
      this.name,
      this.type,
      this.operationType,
      this.fullValue,
      this.manager,
      ) : super();

  List<RequestPostAssetEntity> toPost()  =>
      [RequestPostAssetEntity(name, "immobile", fullValue, manager)];


}