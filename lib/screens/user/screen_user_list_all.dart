import 'package:flutter_app/components/message/component_centered_message.dart';
import 'package:flutter_app/components/screen/component_abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/user/webclient_user.dart';
import 'package:flutter_app/screens/user/screen_user_form_post.dart';



class ScreenUserListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenUserListAllStatefulAbstract() : super(screenStateListAll: ScreenUserListAllStateAbstract());

}

class ScreenUserListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientUser().findAll();

  @override
  get title => "Usuarios";

  @override
  get navigateScreenButton => ScreenUserForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().ownerIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}