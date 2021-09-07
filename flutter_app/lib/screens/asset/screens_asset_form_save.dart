// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/editor.dart';
import 'package:flutter_app/components/field_input.dart';
import 'package:flutter_app/models/asset.dart';
import 'package:flutter_app/models/transferencia.dart';

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

const _textoBotao = "Confirmar";

class ScreensAssetForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreensAssetFormState();
  }
}

class ScreensAssetFormState extends State<ScreensAssetForm> {
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

  void _saveAsset(BuildContext context) {
    //TODO - TRANSFORMAR STRING PRA ENUM

    debugPrint(_controllerFieldAssetFullValue.text);

    if (_controllerFieldAssetName.value != null) {
      Asset asset = Asset(
          name: _controllerFieldAssetName.text,
          type: AssetType.immobile,
          operationType: OperationType.buy,
          fullValue: double.tryParse(_controllerFieldAssetFullValue.text),
          manager: _controllerFieldAssetManager.text);

      if (asset.name != null) {
        Navigator.pop(context, asset);
      }
    }

/*
    Asset asset = Asset(
        name: _controllerFieldAssetName.text,
        type: AssetType.immobile,
        operationType: OperationType.buy,
        fullValue: double.tryParse(_controllerFieldAssetFullValue.text),
        manager: _controllerFieldAssetManager.text);

    if (asset.name != null) {
      Navigator.pop(context, asset);
    }

 */
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

  RaisedButton buildInputSend() {
    return RaisedButton(
        onPressed: () => _saveAsset(context), child: Text(_textoBotao));
  }
}
