import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/immobile/webclient_immobile.dart';
import 'package:flutter_app/screens/immobile/screens_immobile_form_post.dart';



class ScreenImmobileListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenImmobileListAllStatefulAbstract() : super(screenStateListAll: ScreenImmobileListAllStateAbstract());

}

class ScreenImmobileListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientImmobile().findAll();

  @override
  get title => "Imóveis";

  @override
  get navigateScreenButton => ScreenImmobileForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().immobileIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}