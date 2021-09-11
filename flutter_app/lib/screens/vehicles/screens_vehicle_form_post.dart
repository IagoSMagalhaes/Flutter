// Criando formulario
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/button/button_dropdown.dart';
import 'package:flutter_app/components/field/field_input.dart';
import 'package:flutter_app/components/response_dialog.dart';
import 'package:flutter_app/http/helper/helper/abstract_webclient.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/models/vehicle/domain/vehicles.dart';

//Title
const _title = "Criar Veículo";
const _textSuccessPost = "Veículo cadastrado com sucesso";


//Fields
const _fieldTextVehicleName = "Nome do patrimonio";
const _fieldTextVehicleBrand = "Marca";
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


//Button
const _textButton = "Confirmar";

class ScreenVehicleForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenVehicleFormState();
  }
}

class ScreenVehicleFormState extends State<ScreenVehicleForm> {

  final WebClientAsset _webClient = WebClientAsset();

  String dropdownValue = 'Toyota';


  final TextEditingController _controllerFieldVehicleName = TextEditingController();

  final TextEditingController _controllerFieldVehicleBrand = TextEditingController();

  //final TextEditingController _controllerFieldVehicleType =
//      TextEditingController();
  final TextEditingController _controllerFieldVehicleOperationType =
  TextEditingController();
  final TextEditingController _controllerFieldVehicleFullValue =
  TextEditingController();
  final TextEditingController _controllerFieldVehicleManager =
  TextEditingController();

  get isSelected => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: buildBody()
    );
  }


  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildInputBrand(),
          buildInputBrandTest(),
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

  FieldInput buildInputBrand() {
    return FieldInput(
      controller: _controllerFieldVehicleBrand,
      text: "Marca",
      hint: "Ex: Honda, Toyota, Chevrolet",
    );
  }

  /*ToggleButtons buildInputBrandTest() {


    return ToggleButtons(children: [Icon(Icons.ac_unit), Icon(Icons.call)], onPressed: (int index) {

      setState(() {
        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
          if (buttonIndex == index) {
            isSelected[buttonIndex] = true;
          } else {
            isSelected[buttonIndex] = false;
          }
        }
      });
    }, isSelected: isSelected);
  }

   */


  InputDecorator buildInputBrandTest() {
    return InputDecorator(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      child: DropdownButtonHideUnderline(
        child: ButtonSelected(options: ["Toyota", "Honda", "Fiat"], defaultValue: "Toyota"),
      ),
    );
  }

  InputDecorator buildInputOperationType() {
    return InputDecorator(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      child: DropdownButtonHideUnderline(
        child: ButtonSelected(options: ["Venda", "Compra"], defaultValue: "Compra"),
      ),
    );
  }

/*
  FieldInput buildInputOperationType() {
    return FieldInput(
      controller: _controllerFieldVehicleOperationType,
      text: _fieldTextVehicleOperationType,
      hint: _fieldHintVehicleOperationType,
    );
  }

 */

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

  ElevatedButton buildButtonPost() =>
      ElevatedButton(onPressed: () => buildActionOnPressed(),
          child: Text(_textButton));


  Future<dynamic> buildActionOnPressed() {
    return showDialog(context: context,
        builder: (contextDialog) { // Tomar cuidado quando trocar de contexto
          return AuthDialog(onConfirm: (String password) =>
              _postVehicle(context, password));
          //_postVehicle(context, password).then((value) => Navigator.pop(context)));
        });
  }


  Future<void> _postVehicle(BuildContext context, String password) async {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldVehicleName.value != null) {
      final body = buildVehicle().toPost();

      _webClient.post(body, password, context)
          .then((httpResponse) {
        if (httpResponse.statusCode == 200) {
          SuccessDialog().showDialogSuccess(context, _textSuccessPost);
        } else {
          ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));
          FailureDialog(message: apiError.message!).showDialogErrorMessage(
              context);
        }
      });
    }
  }

  Vehicle buildVehicle() {
    double? fullValue = double.tryParse(
        _controllerFieldVehicleFullValue.text.toString());

    return Vehicle(null, _controllerFieldVehicleName.text.toString(), fullValue,
        _controllerFieldVehicleManager.text);
  }


  DropdownButton<String> buildInputSelectBrand() {
    List<String> valores = ["Toyota", "Honda", "Fiat"];

    //List<DropdownMenuItem<String>> listDropDown = valores.map((valor) {
      //return DropdownMenuItem<String>(}).toList();

    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




