// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/http/webclients/immobile/webclient_immobile.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/immobiles/domain/immobiles.dart';
import 'package:flutter_app/models/immobiles/dto/request/request_post_immobile_entity.dart';

const _titulo = "Criar Imóvel";

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

class ScreensImmobileForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreensImmobileFormState();
  }
}

class ScreensImmobileFormState extends State<ScreensImmobileForm> {
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
  final TextEditingController _controllerFieldImmobileAddressStreet =
      TextEditingController();
  final TextEditingController _controllerFieldImmobileAddressDistrict =
      TextEditingController();
  final TextEditingController _controllerFieldImmobileAddressCity =
      TextEditingController();
  final TextEditingController _controllerFieldImmobileAddressState =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInputName(),
            //buildInputType(),
            buildInputOperationType(),
            buildInputFullValue(),
            buildInputManager(),
            buildInputSend()
          ],
        ),
      ),
      appBar: AppBar(title: Text(_titulo)),
    );
  }

  Future<void> _saveImmobile(BuildContext context, String password) async {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldImmobileName.value != null) {
      Immobile immobile = Immobile(null, _controllerFieldImmobileName.text.toString(), null, null, 10, _controllerFieldImmobileManager.text);

      if (immobile.name != null) {

        final double? valor = double.tryParse(_controllerFieldImmobileFullValue.text);
        final String? type = "immobile";

        //List<RequestPostImmobileEntity> body = [RequestPostImmobileEntity(_controllerFieldImmobileName.text, type, valor, _controllerFieldImmobileManager.text)];
        List<RequestPostAssetEntity> body = [RequestPostAssetEntity(_controllerFieldImmobileName.text, type, valor, _controllerFieldImmobileManager.text)];

        WebClientAsset().post(body).then((immobile)  {
        //WebClientImmobile().post(body, password).then((immobile)  {

            showDialog(context: context, builder: (contextDialog) {
              return SuccessDialog('successful transaction');
            });

            Navigator.pop(context);

        }).catchError((exception) {

          _showDialogError(context, exception);

        }, test: (e) => e is Exception);
      }
    }



/*
    Immobile immobile = Immobile(
        name: _controllerFieldImmobileName.text,
        type: ImmobileType.immobile,
        operationType: OperationType.buy,
        fullValue: double.tryParse(_controllerFieldImmobileFullValue.text),
        manager: _controllerFieldImmobileManager.text);

    if (immobile.name != null) {
      Navigator.pop(context, immobile);
    }

 */
  }

  void _showDialogError(BuildContext context, exception) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(exception.toString());
    });
  }


  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldImmobileName,
      text: _fieldTextImmobileName,
      hint: _fieldHintImmobileName,
    );
  }
  /*
  FieldInput buildInputType() {
    return FieldInput(
      controller: _controllerFieldImmobileType,
      text: _fieldTextImmobileType,
      hint: _fieldHintImmobileType,
    );
  }


   */
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

  ElevatedButton buildInputSend()  => ElevatedButton(onPressed: () => buildActionOnPressed(),
                                                    child: Text(_textButton));

  Future<dynamic> buildActionOnPressed() {
      return showDialog(context: context, builder: (contextDialog){ // Tomar cuidado quando trocar de contexto
            return AuthDialog(onConfirm: (String password) {
                print(password);
                _saveImmobile(context, password).then((immobile) {

                });
              },);
          });
    }



}
