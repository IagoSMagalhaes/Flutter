
// Abstração da Transferencia
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/models/asset/asset_address.dart';

class Immobile extends AbstractDomain {

  @override int? id;
  @override String? name;
  final double? fullValue;
  final String? manager;

  Immobile(
      this.id,
      this.name,
      this.fullValue,
      this.manager,
      ) : super();
}