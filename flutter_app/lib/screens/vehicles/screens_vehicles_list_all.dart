import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/http/vehicles/http_vehicles.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';



class ScreenVehiclesListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenVehiclesListAllStatefulAbstract() : super(screenStateListAll: ScreenVehiclesListAllStateAbstract());

}

class ScreenVehiclesListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = HttpVehicles().findAll();

  @override
  get title => "Veículos";

  @override
  get navigateScreenButton => ScreensAssetForm();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}