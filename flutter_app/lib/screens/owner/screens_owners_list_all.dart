import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/asset/owner/webclient_owner.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';



class ScreenOwnerListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenOwnerListAllStatefulAbstract() : super(screenStateListAll: ScreenOwnerListAllStateAbstract());

}

class ScreenOwnerListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientOwner().findAll();

  @override
  get title => "Contatos";

  @override
  get navigateScreenButton => ScreenOwnerForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().ownerIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}