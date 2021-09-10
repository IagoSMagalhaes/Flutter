// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/models/asset/dto/request/request_post_asset_entity.dart';
import 'package:flutter_app/models/vehicle/domain/vehicles.dart';
import 'package:flutter_app/router/factory/router_factory.dart';

const _titulo = "Criar Veículo";
const _textSuccessPost = "Veículo cadastrado com sucesso";

const _fieldTextVehicleName = "Nome do patrimonio";
const _fieldTextVehicleType = "Tipo do patrimônio";
const _fieldTextVehicleOperationType = "Tipo de operação";
const _fieldTextVehicleFullValue = "Valor Total";
const _fieldTextVehicleManager = "Responsável pelo Patrimonio";


const _fieldTextVehicleAddressStreet = "Rua";
const _fieldTextVehicleAddressDistrict = "Bairro";
const _fieldTextVehicleAddressCity = "Cidade";
const _fieldTextVehicleAddressState = "Estado";

const _fieldHintVehicleName = "Ex: Corolla 2018";
const _fieldHintVehicleType = "Ex: Veicúlo, Veículo, Ações";
const _fieldHintVehicleOperationType = "Ex: Compra, Venda";
const _fieldHintVehicleFullValue = "0.00";
const _fieldHintVehicleManager = "Ex: Hugo";



const _textButton = "Confirmar";

class ScreenVehicleForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenVehicleFormState();
  }
}

class ScreenVehicleFormState extends State<ScreenVehicleForm> {

  final RouterFactory _routerFactory = RouterFactory();


  final TextEditingController _controllerFieldVehicleName =
      TextEditingController();
  //final TextEditingController _controllerFieldVehicleType =
//      TextEditingController();
  final TextEditingController _controllerFieldVehicleOperationType =
      TextEditingController();
  final TextEditingController _controllerFieldVehicleFullValue =
      TextEditingController();
  final TextEditingController _controllerFieldVehicleManager =
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
      controller: _controllerFieldVehicleName,
      text: _fieldTextVehicleName,
      hint: _fieldHintVehicleName,
    );
  }


  FieldInput buildInputOperationType() {
    return FieldInput(
      controller: _controllerFieldVehicleOperationType,
      text: _fieldTextVehicleOperationType,
      hint: _fieldHintVehicleOperationType,
    );
  }

  FieldInput buildInputFullValue() {
    return FieldInput(
      controller: _controllerFieldVehicleFullValue,
      text: _fieldTextVehicleFullValue,
      hint: _fieldHintVehicleFullValue,
      keyboardType: TextInputType.number
    );
  }

  FieldInput buildInputManager() {
    return FieldInput(
      controller: _controllerFieldVehicleManager,
      text: _fieldTextVehicleManager,
      hint: _fieldHintVehicleManager,
    );
  }

  ElevatedButton buildButtonPost()  => ElevatedButton(onPressed: () => buildActionOnPressed(),
                                                    child: Text(_textButton));


  Future<dynamic> buildActionOnPressed() {
      return showDialog(context: context, builder: (contextDialog){ // Tomar cuidado quando trocar de contexto
            return AuthDialog(onConfirm: (String password) {
                _postVehicle(context, password).then((value) => Navigator.pop(context));
              },);
          });
    }


  Future<void> _postVehicle(BuildContext context, String password) async {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldVehicleName.value != null) {

      List<RequestPostAssetEntity> body =  buildVehicle().toPost();

      await request(body, password, context);

      //Navigator.pop(context);
      //Está direcionando para a home pq n consegui atulizar o widget logo apos que salvar
      _routerFactory.navigateToScreenVehicleList(context);

    }

  }

  Future<void> request(List<RequestPostAssetEntity> body, String password, BuildContext context) async {
    await WebClientAsset().post(body, password)
                          .catchError((exception) => FailureDialog(exception.toString()),
                          test: (e) => e is Exception);

    await SuccessDialog(_textSuccessPost).showDialogSuccess(context);
  }


  Vehicle buildVehicle() {
    double? fullValue = double.tryParse(_controllerFieldVehicleFullValue.text.toString());

    return Vehicle(null, _controllerFieldVehicleName.text.toString(), fullValue, _controllerFieldVehicleManager.text);

  }


}
