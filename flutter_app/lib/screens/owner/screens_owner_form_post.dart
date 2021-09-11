// Criando formulario
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/http/webclients/asset/owner/webclient_owner.dart';
import 'package:flutter_app/models/owner/domain/owner.dart';


//Title
const _title = "Criar Contato";
const _textSuccessPost = "Contato cadastrado com sucesso";


//Fields
const _fieldTextOwnerName = "Nome";
const _fieldTextOwnerCellphone = "Telefone";
const _fieldHintOwnerCellphone = "(00) 0 0000-0000";

//Button
const _textButton = "Confirmar";




class ScreenOwnerForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenOwnerFormState();
  }
}


class ScreenOwnerFormState extends State<ScreenOwnerForm> {

  final WebClientOwner _webClient = WebClientOwner();

  final TextEditingController _controllerFieldOwnerName = TextEditingController();

  final TextEditingController _controllerFieldOwnerCellphone =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildInputCellphone(),
          buildButtonPost()
        ],
      ),
    );
  }



  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldOwnerName,
      text: _fieldTextOwnerName
    );
  }

  FieldInput buildInputCellphone() {
    return FieldInput(
      controller: _controllerFieldOwnerCellphone,
      text: _fieldTextOwnerCellphone,
      hint: _fieldHintOwnerCellphone,
    );
  }

  ElevatedButton buildButtonPost() {
    return ElevatedButton(onPressed: () => buildActionOnPressed(),
        child: Text(_textButton));
  }

  Future<dynamic> buildActionOnPressed() {
    return showDialog(context: context, builder: (contextDialog){
      return AuthDialog(onConfirm: (String password)  =>
          _postOwner(context, password));
  });
  }



  Future<void> _postOwner(BuildContext context, String password) async {

    //validatorPostOwner()
    if (_controllerFieldOwnerName.value != null) {

        final body = buildOwner().toPost();

        _webClient.post(body, password, context)
                        .then((httpResponse) {

          if(httpResponse.statusCode == 200){
            SuccessDialog().showDialogSuccess(context, _textSuccessPost);
          } else {
            ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));
            FailureDialog(message: apiError.message!).showDialogErrorMessage(context);
          }
        });
        }
    }

  Owner buildOwner() => Owner(null, _controllerFieldOwnerName.text, _controllerFieldOwnerCellphone.text);
  
}
