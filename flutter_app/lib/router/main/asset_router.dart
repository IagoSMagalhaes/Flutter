
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/dashboard/dashboard.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_save.dart';


class AssetRouter {

  String get initialRoute => '/home';

  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
      '/home': (BuildContext context) =>  Dashboard(),
      //'/home': (BuildContext context) =>  ScreenAssetList(),
      '/post/asset': (BuildContext context) => ScreensAssetForm(),
    };
  }

}