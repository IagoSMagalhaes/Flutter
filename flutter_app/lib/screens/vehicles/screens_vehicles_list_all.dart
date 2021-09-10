import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/vehicles/webclient_vehicles.dart';
import 'package:flutter_app/screens/vehicles/screens_vehicle_form_post.dart';



class ScreenVehicleListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenVehicleListAllStatefulAbstract() : super(screenStateListAll: ScreenVehiclesListAllStateAbstract());

}

class ScreenVehiclesListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientVehicles().findAll();

  @override
  get title => "Veículos";

  @override
  get navigateScreenButton => ScreenVehicleForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().vehicleIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}