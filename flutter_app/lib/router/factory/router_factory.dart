
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';
import 'package:flutter_app/screens/asset/screens_asset_list_all.dart';
import 'package:flutter_app/screens/immobile/screens_immobile_form_post.dart';
import 'package:flutter_app/screens/immobile/screens_immobile_list_all.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';
import 'package:flutter_app/screens/owner/screens_owners_list_all.dart';
import 'package:flutter_app/screens/vehicles/screens_vehicles_list_all.dart';


class RouterFactory {

  void navigateToScreenAssetList(context) => navigateTo(context,  ScreenAssetListAllStatefulAbstract());
  void navigateToScreenAssetFormPost(context) => navigateTo(context,  ScreenAssetForm());


  void navigateToScreenOwnerList(context) => navigateTo(context,  ScreenOwnerListAllStatefulAbstract());
  void navigateToScreenOwnerPost(context) => navigateTo(context,  ScreenOwnerForm());

  void navigateToScreenVehicleList(context) => navigateTo(context, ScreenVehicleListAllStatefulAbstract());


  void navigateToScreenImmobileList(context) => navigateTo(context,  ScreenImmobileListAllStatefulAbstract());
  void navigateToScreenImmobilePost(context) => navigateTo(context,  ScreenImmobileForm());


  Future<void> navigateTo(context, StatefulWidget statefulWidget) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => statefulWidget));

}