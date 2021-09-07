
// Abstração da Transferencia
import 'package:flutter_app/models/asset_address.dart';

class Asset {
  final String? name;
  final AssetType? type;
  final OperationType? operationType;
  final double? fullValue;
  //final double? currentValue;
 // final Address? address;
  final String? manager;

  //Asset(this.name, this.type, this.operationType, this.fullValue, this.address, this.manager);

  const Asset({this.name, this.type, this.operationType, this.fullValue, this.manager})
      : super();
}


enum AssetType {
  vehicles, immobile, actions, others
}

enum OperationType {
  buy, sell
}