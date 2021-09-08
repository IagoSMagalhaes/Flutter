import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/http/immobile/http_immobile.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';



class ScreenImmobileListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenImmobileListAllStatefulAbstract() : super(screenStateListAll: ScreenImmobileListAllStateAbstract());

}

class ScreenImmobileListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = HttpImmobile().findAll();

  @override
  get title => "Imóveis";

  @override
  get navigateScreenButton => ScreensAssetForm();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}