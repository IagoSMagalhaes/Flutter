// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/immobile/domain/immobiles.dart';
import 'package:flutter_app/router/factory/router_factory.dart';

const _titulo = "Criar Imóvel";
const _textSuccessPost = "Imóvel cadastrado com sucesso";

const _fieldTextImmobileName = "Nome do patrimonio";
const _fieldTextImmobileType = "Tipo do patrimônio";
const _fieldTextImmobileOperationType = "Tipo de operação";
const _fieldTextImmobileFullValue = "Valor Total";
const _fieldTextImmobileManager = "Responsável pelo Patrimonio";


const _fieldTextImmobileAddressStreet = "Rua";
const _fieldTextImmobileAddressDistrict = "Bairro";
const _fieldTextImmobileAddressCity = "Cidade";
const _fieldTextImmobileAddressState = "Estado";

const _fieldHintImmobileName = "Ex: Corolla 2018";
const _fieldHintImmobileType = "Ex: Veicúlo, Imóvel, Ações";
const _fieldHintImmobileOperationType = "Ex: Compra, Venda";
const _fieldHintImmobileFullValue = "0.00";
const _fieldHintImmobileManager = "Ex: Hugo";



const _textButton = "Confirmar";

class ScreenImmobileForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenImmobileFormState();
  }
}

class ScreenImmobileFormState extends State<ScreenImmobileForm> {

  final RouterFactory _routerFactory = RouterFactory();


  final TextEditingController _controllerFieldImmobileName =
      TextEditingController();
  //final TextEditingController _controllerFieldImmobileType =
//      TextEditingController();
  final TextEditingController _controllerFieldImmobileOperationType =
      TextEditingController();
  final TextEditingController _controllerFieldImmobileFullValue =
      TextEditingController();
  final TextEditingController _controllerFieldImmobileManager =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titulo)),
      body: buildBody()
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildInputOperationType(),
          buildInputFullValue(),
          buildInputManager(),
          buildButtonPost()
        ],
      ),
    );
  }


  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldImmobileName,
      text: _fieldTextImmobileName,
      hint: _fieldHintImmobileName,
    );
  }


  FieldInput buildInputOperationType() {
    return FieldInput(
      controller: _controllerFieldImmobileOperationType,
      text: _fieldTextImmobileOperationType,
      hint: _fieldHintImmobileOperationType,
    );
  }

  FieldInput buildInputFullValue() {
    return FieldInput(
      controller: _controllerFieldImmobileFullValue,
      text: _fieldTextImmobileFullValue,
      hint: _fieldHintImmobileFullValue,
      keyboardType: TextInputType.number
    );
  }

  FieldInput buildInputManager() {
    return FieldInput(
      controller: _controllerFieldImmobileManager,
      text: _fieldTextImmobileManager,
      hint: _fieldHintImmobileManager,
    );
  }

  ElevatedButton buildButtonPost()  => ElevatedButton(onPressed: () => buildActionOnPressed(),
                                                    child: Text(_textButton));


  Future<dynamic> buildActionOnPressed() {
      return showDialog(context: context, builder: (contextDialog){ // Tomar cuidado quando trocar de contexto
            return AuthDialog(onConfirm: (String password) {
                _postImmobile(context, password).then((value) => Navigator.pop(context));
              },);
          });
    }


  Future<void> _postImmobile(BuildContext context, String password) async {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldImmobileName.value != null) {

      List<RequestPostAssetEntity> body =  buildImmobile().toPost();

      await request(body, password, context);

      //Navigator.pop(context);
      //Está direcionando para a home pq n consegui atulizar o widget logo apos que salvar
      _routerFactory.navigateToScreenImmobileList(context);

    }

  }

  Future<void> request(List<RequestPostAssetEntity> body, String password, BuildContext context) async {
    await WebClientAsset().post(body, password)
                          .catchError((exception) => FailureDialog(exception.toString()),
                          test: (e) => e is Exception);

    await SuccessDialog(_textSuccessPost).showDialogSuccess(context);
  }


  Immobile buildImmobile() =>
      Immobile(null, _controllerFieldImmobileName.text.toString(), null, null, 10, _controllerFieldImmobileManager.text);



}