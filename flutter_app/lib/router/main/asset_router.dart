
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_save.dart';
import 'package:flutter_app/screens/asset/screens_asset_list_all.dart';


class AssetRouter {

  String get initialRoute => '/home';

  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
      '/home': (BuildContext context) =>  ScreenAssetList(),
      '/post/asset': (BuildContext context) => ScreensAssetForm(),
    };
  }

}