
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';


class AssetRouter {

  String get initialRoute => '/home';

  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
      '/home': (BuildContext context) =>  Dashboard(),
      //'/home': (BuildContext context) =>  ScreenAssetList(),
      '/post/asset': (BuildContext context) => ScreensAssetForm(),
      '/post/owner': (BuildContext context) => ScreensOwnerForm(),
    };
  }

}