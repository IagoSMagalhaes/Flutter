// Criando formulario
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/button/component_button_dropdown.dart';
import 'package:flutter_app/components/button/component_button_dropdown_domain.dart';
import 'package:flutter_app/components/component_response_dialog.dart';
import 'package:flutter_app/components/field/component_field_input.dart';
import 'package:flutter_app/http/webclients/userImage/webclient_user_image.dart';
import 'package:flutter_app/models/user/dto/request/request_post_user.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';

//Title
const _title = "Criar Imóvel";
const _textSuccessPost = "Imóvel cadastrado com sucesso";

//Fields
const _fieldTextImmobileName = "Nome do patrimonio";
const _fieldTextImmobilePostalCode = "CEP";
const _fieldTextImmobileType = "Tipo do patrimônio";
const _fieldTextImmobileOperationType = "Tipo de operação";
const _fieldTextImmobileFullValue = "Valor Total";
const _fieldTextImmobileManager = "Responsável pelo Patrimonio";
const _fieldTextImmobileDescription = "Descrição";

const _fieldTextImmobileAddressNumber = "Número";
const _fieldTextImmobileAddressStreet = "Rua";
const _fieldTextImmobileAddressDistrict = "Bairro";
const _fieldTextImmobileAddressCity = "Cidade";
const _fieldTextImmobileAddressState = "Estado";
const _fieldOptionsVehicleOperationType = ["Compra", "Venda", "Locação", "Alugado", "Em negociação"];
const _fieldTextVehicleOperationType = "Tipo de operação";

const _fieldHintImmobileName = "Ex: Corolla 2018";
const _fieldHintImmobilePostalCode = "Ex: 02308-205";
const _fieldHintImmobileDistrict = "Ex: Bosque Maia, Bela Vista";
const _fieldHintImmobileStreet = "Ex: Harry simon";
const _fieldHintImmobileOperationType = "Ex: Compra, Venda";
const _fieldHintImmobileFullValue = "0.00";
const _fieldHintImmobileManager = "Ex: Hugo";


//Button
const _textButton = "Confirmar";

//Domain
const _domainCity = "city";
const _domainState = "state";

class ScreenUserImageForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreenUserImageFormState();
  }
}

class ScreenUserImageFormState extends State<ScreenUserImageForm> {

  final WebClientUserImage _webClient = WebClientUserImage();

  final TextEditingController _controllerFieldImmobileName = TextEditingController();
  final TextEditingController _controllerFieldImmobilePostalCode = TextEditingController();
  final TextEditingController _controllerFieldImmobileDistrict = TextEditingController();
  final TextEditingController _controllerFieldImmobileStreet = TextEditingController();
  final TextEditingController _controllerFieldImmobileNumber = TextEditingController();
  final TextEditingController _controllerFieldImmobileFullValue = TextEditingController();
  final TextEditingController _controllerFieldImmobileManager = TextEditingController();
  final TextEditingController _controllerFieldImmobileDescription = TextEditingController();

  //TODO - EVOLUIR, Deve-se buscar cidades do estado X
  final _buttonSelectCity = ButtonSelectedDomain(domain: _domainCity, hint: _fieldTextImmobileAddressCity);
  final _buttonSelectState = ButtonSelectedDomain(domain: _domainState, hint: _fieldTextImmobileAddressState);

  final _buttonSelectOperationType = ButtonSelected(options: _fieldOptionsVehicleOperationType,
      hint: _fieldTextVehicleOperationType);

  @override
  Widget build(BuildContext context) {

    print("buildTheme");
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,
          title: Text(_title)),
      body: buildBody()
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildPostalCode(),
          _buttonSelectState,
          _buttonSelectCity,
          buildInputDistrict(),
          buildInputStreet(),
          buildInputNumber(),
          _buttonSelectOperationType,
          buildInputFullValue(),
          buildInputManager(),
          buildInputDescription(),
          buildButtonPost()
        ],
      ),
    );
  }


  buildInputName()  => FieldInput(
      controller: _controllerFieldImmobileName,
      text: _fieldTextImmobileName,
      hint: _fieldHintImmobileName);

  buildPostalCode()  => FieldInput(
      controller: _controllerFieldImmobilePostalCode,
      text: _fieldTextImmobilePostalCode,
      hint: _fieldHintImmobilePostalCode);

  buildInputDistrict() => FieldInput(
      controller: _controllerFieldImmobileDistrict,
      text: _fieldTextImmobileAddressDistrict,
      hint: _fieldHintImmobileDistrict);

  buildInputStreet() => FieldInput(
      controller: _controllerFieldImmobileStreet,
      text: _fieldTextImmobileAddressStreet,
      hint: _fieldHintImmobileStreet);

  buildInputNumber()  => FieldInput(
      controller: _controllerFieldImmobileNumber,
      text: _fieldTextImmobileAddressNumber);


  buildInputFullValue() => FieldInput(
      controller: _controllerFieldImmobileFullValue,
      text: _fieldTextImmobileFullValue,
      hint: _fieldHintImmobileFullValue,
      keyboardType: TextInputType.number);


  buildInputManager()  => FieldInput(
      controller: _controllerFieldImmobileManager,
      text: _fieldTextImmobileManager,
      hint: _fieldHintImmobileManager);

  buildInputDescription() => FieldInput(controller: _controllerFieldImmobileDescription,
                                        text: _fieldTextImmobileDescription);


  ElevatedButton buildButtonPost()  => ElevatedButton(onPressed: () => buildActionOnPressed(),
                                                    child: Text(_textButton));
/*
  buildTeste() => TextFormField(
  // The validator receives the text that the user has entered.
  validator: (value) {
  if (value == null || value.isEmpty) {
  return 'Please enter some text';
  }
  return null;
  },
  );


 */


  Future<dynamic> buildActionOnPressed() {


      return showDialog(context: context, builder: (contextDialog) { // Tomar cuidado quando trocar de contexto
        return AuthDialog(onConfirm: (String password) =>
            _postImmobile(context, password));
      });
    }


  Future<void> _postImmobile(BuildContext context, String password) async {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldImmobileName.value != null) {

      final body = buildPost().toPost();

      _webClient.post(body, "")
          .then((httpResponse) {

        //if(httpResponse.statusCode == 200){
          SuccessDialog().showDialogSuccess(context, _textSuccessPost)
                        .then((value) => RouterFactory().navigateToScreenUserImageList(context));

        //} else {
          //ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));
          FailureDialog(message: "Message").showDialogErrorMessage(context);
        //}
      });
    }
  }

  buildPost() => RequestPostUserEntity(null, _controllerFieldImmobileName.text.toString());

}
