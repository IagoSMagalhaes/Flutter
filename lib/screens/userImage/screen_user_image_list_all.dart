import 'package:flutter/material.dart';
import 'package:flutter_app/components/gridView/list_view_image_component.dart';
import 'package:flutter_app/http/webclients/userImage/webclient_user_image.dart';




const secondColor = Color(0xFF01565C0);
const primaryColor = Color(0xFF01579B);

class ScreenUserImageListAllStatefulAbstract extends ScreenAbstractListAllImage {

  ScreenUserImageListAllStatefulAbstract() : super(screenStateListAllImage: ScreenUserImageListAllStateAbstract());

}

class ScreenUserImageListAllStateAbstract extends AbstractScreenStateListAllImage {
/*
  @override
  List<AbstractItemListView> items = [
    AbstractItemListView(1, "Casa terrea Gopouva 120m2", "Responsável: Hugo", "http://localhost:8081/immobile/v1/image/1", ScreenUserImageDetail(1)),
    AbstractItemListView(2, "Sobrado Bosque Maia 70m2", "Responsável: Wagner", "http://localhost:8081/immobile/v1/image/2", ScreenUserImageDetail(2)),
    AbstractItemListView(3, "Casa terrea Macedo 90m2", "Responsável: Hugo", "http://localhost:8081/immobile/v1/image/3", ScreenUserImageDetail(3)),
  ];

 */
  @override
  List<AbstractItemListView> items = WebClientUserImage().getAllAndImage();
}



/*


class ScreenUserImageListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenUserImageListAllStatefulAbstract() : super(screenStateListAll: ScreenUserImageListAllStateAbstract());

}

class ScreenUserImageListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientUserImage().get();

  @override
  get title => "Imóveis";

  @override
  get navigateScreenButton => ScreenUserImageForm();

  @override
  get navigateScreenDetail => ScreenUserImageDetail(null);

  //@override
  //get onClick => onClicks;

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().immobileIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  //void onClicks(context) => RouterFactory().navigateTo(context, ScreenUserImageDetail(1));

}

 */