
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';
import 'package:flutter_app/screens/user/screen_user_form_post.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_form_post.dart';


class RouterAssetConfig {

  String get initialRoute => '/home';

  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
      //'/home': (BuildContext context) =>  AuthDialog(),
     '/home': (BuildContext context) =>  Dashboard(),
      //'/home': (BuildContext context) =>  DashBoardTest(),
      //'/home': (BuildContext context) =>  ScreenAssetList(),
      '/post/user': (BuildContext context) => ScreenUserForm(),
      '/post/user/image': (BuildContext context) => ScreenUserImageForm(),
    };
  }

}