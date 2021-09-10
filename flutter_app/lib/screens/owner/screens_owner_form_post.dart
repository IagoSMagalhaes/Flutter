// Criando formulario
import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/webclients/asset/owner/webclient_owner.dart';
import 'package:flutter_app/models/owner/domain/owner.dart';
import 'package:flutter_app/models/owner/dto/request/request_post_owner.dart';
import 'package:flutter_app/router/factory/router_factory.dart';

const _titulo = "Criar Contato";
const _textSuccessPost = "Contato cadastrado com sucesso";

const _fieldTextOwnerName = "Nome";
const _fieldTextOwnerCellphone = "Telefone";

const _fieldHintOwnerCellphone = "(00) 0 0000-0000";

const _textButton = "Confirmar";

class ScreenOwnerForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenOwnerFormState();
  }
}

class ScreenOwnerFormState extends State<ScreenOwnerForm> {

  final TextEditingController _controllerFieldOwnerName =
      TextEditingController();

  final TextEditingController _controllerFieldOwnerCellphone =
      TextEditingController();

  final RouterFactory _routerFactory = RouterFactory();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titulo)),
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
    return ElevatedButton(onPressed: () => showDialog(context: context, builder: (contextDialog){
      return AuthDialog(onConfirm: (String password) {
        _postOwner(context, password);
      },);
    }),
        child: Text(_textButton));
  }



  Future<void> _postOwner(BuildContext context, String password) async {

    //TODO - TRANSFORMAR STRING PRA ENUM

    print("1");
    if (_controllerFieldOwnerName.value != null) {

        final body = buildOwner().toPost();

        await request(body, password, context);

        Navigator.pop(context);
        //Está direcionando para a home pq n consegui atulizar o widget logo apos que salvar
        _routerFactory.navigateToScreenOwnerList(context);

    }


  }

  Future<void> request(List<RequestPostOwnerEntity> body, String password, BuildContext context) async {
    print("12");
    /*
    await WebClientOwner().post(body, password)
        .catchError((exception)  {
      print("12.1");
          FailureDialog(exception.toString());
    },
        test: (e) => e is HttpException)
        .catchError((exception) {
      print("11.1");
          FailureDialog(exception.toString()).showUnknowError(context);
        } );

     */

    WebClientOwner().post(body, password, context)
                      .catchError((e) {
                        print("cai aqui");
                        FailureDialog(e.toString()).showDialogError(context, e);
                          }, test: (e) => e is HttpException)
                      .catchError((e) {
                        print("cai aqui 2");
                        FailureDialog(e.toString()).showDialogError(context, e);
                          }, test: (e) => e is TimeoutException)
                      .catchError((e) {
                        print("cai aqui 3");
                        FailureDialog(e.toString()).showUnknowError(context);})
                  .then((value) =>
        SuccessDialog(_textSuccessPost).showDialogSuccess(context)
    );

    print("10");

   // await SuccessDialog(_textSuccessPost).showDialogSuccess(context);
  }


  Owner buildOwner() {
    return Owner(null, _controllerFieldOwnerName.text,
        _controllerFieldOwnerCellphone.text);
  }
}
