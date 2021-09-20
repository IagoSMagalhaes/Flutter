// Criando formulario
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/button/component_button_dropdown.dart';
import 'package:flutter_app/components/button/component_button_dropdown_domain.dart';
import 'package:flutter_app/components/component_response_dialog.dart';
import 'package:flutter_app/components/field/component_field_input.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/http/webclients/user/webclient_user.dart';
import 'package:flutter_app/models/user/domain/model_user.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';


//Title
const _title = "Criar Contato";
const _textSuccessPost = "Contato cadastrado com sucesso";


//Fields
const _fieldTextUserName = "Nome";
const _fieldTextUserCellphone = "Telefone";
const _fieldHintUserCellphone = "(00) 0 0000-0000";


const _fieldTextUserEmail = "Email";
const _fieldHintUserEmail = "...@gmail.com.br";

//Button
const _textButton = "Confirmar";

const _typeUserOptions = ["Administrador", "Funcionario", "Convidado"];
const _fieldTextTypeUserOptions = "Tipo de usuario";


const _fieldTextUserCity = "Cidade";
const _fieldTextUserState = "Estado";
const _fieldTextUserProfession = "Estado";


//Domain
const _domainCity = "city";
const _domainState = "state";
const _domainProfession = "profession";

class ScreenUserForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenUserFormState();
  }
}


class ScreenUserFormState extends State<ScreenUserForm> {

  final WebClientUser _webClient = WebClientUser();

  final _buttonSelectOperationType = ButtonSelected(options: _typeUserOptions,
      hint: _fieldTextTypeUserOptions);

  final _buttonSelectCity = ButtonSelectedDomain(domain: _domainCity, hint: _fieldTextUserCity);
  final _buttonSelectState = ButtonSelectedDomain(domain: _domainState, hint: _fieldTextUserState);
  //final _buttonSelectProfession = ButtonSelectedDomain(domain: _domainProfession, hint: _fieldTextUserProfession);

  final TextEditingController _controllerFieldUserName = TextEditingController();

  final TextEditingController _controllerFieldUserCellphone = TextEditingController();
  final TextEditingController _controllerFieldUserEmail = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor, title: Text(_title)),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildInputCellphone(),
          buildInputEmail(),
          _buttonSelectOperationType,
          //_buttonSelectProfession,
          _buttonSelectState,
          _buttonSelectCity,
          buildButtonPost()
        ],
      ),
    );
  }

  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldUserName,
      text: _fieldTextUserName
    );
  }

  FieldInput buildInputCellphone() {
    return FieldInput(
      controller: _controllerFieldUserCellphone,
      text: _fieldTextUserCellphone,
      hint: _fieldHintUserCellphone,
    );
  }

  buildInputEmail() {
    return FieldInput(
      controller: _controllerFieldUserEmail,
      text: _fieldTextUserEmail,
      hint: _fieldHintUserEmail,
    );
  }

  ElevatedButton buildButtonPost() {
    return ElevatedButton(onPressed: () => buildActionOnPressed(),
        child: Text(_textButton));
  }

  Future<dynamic> buildActionOnPressed() {
    return showDialog(context: context, builder: (contextDialog){
      return AuthDialog(onConfirm: (String password)  =>
          _postUser(context, password));
  });
  }



  Future<void> _postUser(BuildContext context, String password) async {

    //validatorPostUser()
    if (_controllerFieldUserName.value != null) {

        final body = buildUser().toPost();

        _webClient.post(body, password, context)
                        .then((httpResponse) {

          if(httpResponse.statusCode == 200){
            SuccessDialog().showDialogSuccess(context, _textSuccessPost)
                           .then((value) => RouterFactory().navigateToScreenUserList(context));
          } else {
            ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));
            FailureDialog(message: apiError.message!).showDialogErrorMessage(context);
          }
        });
        }
    }

  User buildUser() => User(null, _controllerFieldUserName.text, _controllerFieldUserCellphone.text);
  
}
