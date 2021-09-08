
import 'package:flutter_app/components/screen/abstract_screen.dart';

class Owner extends AbstractDomain {

  @override int? id;
  @override String? name;
  final String? cellphone;


  Owner(
    this.id,
    this.name,
    this.cellphone,
  ) : super();

}