
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';
import 'package:flutter_app/screens/asset/screens_asset_list_all.dart';


Future<dynamic> navigatorToAssetFormPost(BuildContext context) {
  return Navigator.push(context, MaterialPageRoute(builder: (context) {
    return ScreensAssetForm();
  }));
}