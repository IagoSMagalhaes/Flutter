import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';





class ScreenAssetListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenAssetListAllStatefulAbstract() : super(screenStateListAll: ScreenAssetListAllStateAbstract());

}

class ScreenAssetListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientAsset().findAllAssets();

  @override
  get title => "Patrimônios";

  @override
  get navigateScreenButton => ScreenAssetForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().assetIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}