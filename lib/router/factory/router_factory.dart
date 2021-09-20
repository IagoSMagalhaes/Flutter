
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/configuration/screen_configuration.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';
import 'package:flutter_app/screens/user/screen_user_form_post.dart';
import 'package:flutter_app/screens/user/screen_user_list_all.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_form_post.dart';


class RouterFactory {
  void navigateToScreenUserList(context) => navigateTo(context,  ScreenUserListAllStatefulAbstract());
  void navigateToScreenUserPost(context) => navigateTo(context,  ScreenUserForm());

  //void navigateToScreenUserImageList(context) => navigateTo(context,  ScreenUserImageListAllStatefulAbstract());
  void navigateToScreenUserImageList(context) => navigateTo(context,  Dashboard());
  void navigateToScreenUserImagePost(context) => navigateTo(context,  ScreenUserImageForm());


  void navigateToScreenConfiguration(context) => navigateTo(context, ScreenConfiguration());


  Future<void> navigateTo(context, StatefulWidget statefulWidget) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => statefulWidget));

}