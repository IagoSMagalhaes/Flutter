
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/models/asset/asset_address.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';

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
}