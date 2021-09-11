// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/field/field_input.dart';

const _titulo = "Criar patrimônio";

const _fieldTextAssetName = "Nome do patrimonio";
const _fieldTextAssetType = "Tipo do patrimônio";
const _fieldTextAssetOperationType = "Tipo de operação";
const _fieldTextAssetFullValue = "Valor Total";
const _fieldTextAssetManager = "Responsável pelo Patrimonio";
//const _fieldTextAssetCurrentValue = "Valor corrente";

const _fieldTextAssetAddressStreet = "Rua";
const _fieldTextAssetAddressDistrict = "Bairro";
const _fieldTextAssetAddressCity = "Cidade";
const _fieldTextAssetAddressState = "Estado";

const _fieldHintAssetName = "Ex: Corolla 2018";
const _fieldHintAssetType = "Ex: Veicúlo, Imóvel, Ações";
const _fieldHintAssetOperationType = "Ex: Compra, Venda";
const _fieldHintAssetFullValue = "0.00";
const _fieldHintAssetManager = "Ex: Hugo";
//const _fieldHintAssetCurrentValue = "Valor corrente";

//const _fieldHintAssetAddressStreet = "R. ";
//const _fieldHintAssetAddressDistrict = "";
//const _fieldHintAssetAddressCity = "SP";
//const _fieldHintAssetAddressState = "";

const _textButton = "Confirmar";

class ScreenAssetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenAssetFormState();
  }
}

class ScreenAssetFormState extends State<ScreenAssetForm> {
  final TextEditingController _controllerFieldAssetName =
      TextEditingController();
  final TextEditingController _controllerFieldAssetType =
      TextEditingController();
  final TextEditingController _controllerFieldAssetOperationType =
      TextEditingController();
  final TextEditingController _controllerFieldAssetFullValue =
      TextEditingController();
  final TextEditingController _controllerFieldAssetManager =
      TextEditingController();
  final TextEditingController _controllerFieldAssetAddressStreet =
      TextEditingController();
  final TextEditingController _controllerFieldAssetAddressDistrict =
      TextEditingController();
  final TextEditingController _controllerFieldAssetAddressCity =
      TextEditingController();
  final TextEditingController _controllerFieldAssetAddressState =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInputName(),
            buildInputType(),
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

  //Nessa tela, nao deve salvar, e sim direcionar para escolhar qual tipo de patrimonio quer inserir
  void _saveAsset(BuildContext context, String password) {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldAssetName.value != null) {

    }
  }

  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldAssetName,
      text: _fieldTextAssetName,
      hint: _fieldHintAssetName,
    );
  }

  FieldInput buildInputType() {
    return FieldInput(
      controller: _controllerFieldAssetType,
      text: _fieldTextAssetType,
      hint: _fieldHintAssetType,
    );
  }

  FieldInput buildInputOperationType() {
    return FieldInput(
      controller: _controllerFieldAssetOperationType,
      text: _fieldTextAssetOperationType,
      hint: _fieldHintAssetOperationType,
    );
  }

  FieldInput buildInputFullValue() {
    return FieldInput(
      controller: _controllerFieldAssetFullValue,
      text: _fieldTextAssetFullValue,
      hint: _fieldHintAssetFullValue,
      keyboardType: TextInputType.number
    );
  }

  FieldInput buildInputManager() {
    return FieldInput(
      controller: _controllerFieldAssetManager,
      text: _fieldTextAssetManager,
      hint: _fieldHintAssetManager,
    );
  }

  ElevatedButton buildInputSend()  =>
      ElevatedButton(onPressed: () => _saveAsset(context, "password"),
                     child: Text(_textButton));



}
