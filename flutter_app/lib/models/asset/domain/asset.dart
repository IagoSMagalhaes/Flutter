
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/models/asset/asset_address.dart';

class Asset extends AbstractDomain {

  @override int? id;
  @override String? name;
  final AssetType? type;
  final OperationType? operationType;
  final double? fullValue;
  //final double? currentValue;
 // final Address? address;
  final String? manager;

  Asset(
      this.id,
      this.name,
      this.type,
      this.operationType,
      this.fullValue,
      this.manager,
      ) : super();


  //Asset(this.name, this.type, this.operationType, this.fullValue, this.address, this.manager);

  //const Asset({this.id, this.name, this.type, this.operationType, this.fullValue, this.manager}): super(id, name);
}


enum AssetType {
  vehicles, immobile, actions, others
}

enum OperationType {
  buy, sell
}