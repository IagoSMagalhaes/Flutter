
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/models/asset/asset_address.dart';

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
}