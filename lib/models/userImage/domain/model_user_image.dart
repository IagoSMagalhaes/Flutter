
// Abstração da Transferencia
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';

class UserImage extends AbstractDomain {

  @override int? id;
  @override String? name;
  //final AssetType? type;
  //final OperationType? operationType;
  final double? fullValue;
  //final double? currentValue;
  // final Address? address;
  final String? manager;

  UserImage(
      this.id,
      this.name,
  //    this.type,
   //   this.operationType,
      this.fullValue,
      this.manager,
      ) : super();

  //List<RequestPostUserEntity> toPost()  =>[RequestPostUserEntity(name, "immobile", fullValue, manager)];


}