import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/field/component_field_input.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/components/message/component_centered_message.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';

import 'package:flutter_app/http/webclients/userImage/webclient_user_image.dart';
import 'package:flutter_app/models/userImage/domain/model_user_image.dart';
import 'package:flutter_app/models/userImage/dto/response/response_get_immobile_entity.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/configuration/screen_configuration.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_payments.dart';

const _ScreenUserImageDetailTitle = "Detalhes do imovel";



//Fields
const _fieldTextUserImageName = "Nome do patrimonio";
const _fieldTextUserImagePostalCode = "CEP";
const _fieldTextUserImageType = "Tipo do patrimônio";
const _fieldTextUserImageOperationType = "Tipo de operação";
const _fieldTextUserImageFullValue = "Valor Total";
const _fieldTextUserImageManager = "Responsável pelo Patrimonio";
const _fieldTextUserImageDescription = "Descrição";

const _fieldTextUserImageAddressNumber = "Número";
const _fieldTextUserImageAddressStreet = "Rua";
const _fieldTextUserImageAddressDistrict = "Bairro";
const _fieldTextUserImageAddressCity = "Cidade";
const _fieldTextUserImageAddressState = "Estado";
const _fieldOptionsVehicleOperationType = ["Compra", "Venda", "Locação", "Alugado", "Em negociação"];
const _fieldTextVehicleOperationType = "Tipo de operação";

const primaryColor = Color(0xFF01579B);
const secondColor = Color(0xFF01565C0);

const _fieldHintUserImageName = "Ex: Corolla 2018";
const _fieldHintUserImagePostalCode = "Ex: 02308-205";
const _fieldHintUserImageDistrict = "Ex: Bosque Maia, Bela Vista";
const _fieldHintUserImageStreet = "Ex: Harry simon";
const _fieldHintUserImageOperationType = "Ex: Compra, Venda";
const _fieldHintUserImageFullValue = "0.00";
const _fieldHintUserImageManager = "Ex: Hugo";


class ScreenUserImageDetail extends StatefulWidget {

  int? _id;

  ScreenUserImageDetail(this._id);

  @override
  State<StatefulWidget> createState() {
    return ScreenUserImageDetailState();
  }
}

class ScreenUserImageDetailState extends State<ScreenUserImageDetail> {


  TextEditingController _controllerFieldUserImageName = TextEditingController();
  TextEditingController _controllerFieldUserImagePostalCode = TextEditingController();
  TextEditingController _controllerFieldUserImageDistrict = TextEditingController();
  TextEditingController _controllerFieldUserImageStreet = TextEditingController();
  TextEditingController _controllerFieldUserImageNumber = TextEditingController();
  TextEditingController _controllerFieldUserImageFullValue = TextEditingController();
  TextEditingController _controllerFieldUserImageManager = TextEditingController();
  TextEditingController _controllerFieldUserImageDescription = TextEditingController();

  final httpHelper = WebClientHelper();
  final centeredMessageFactory = CenteredMessageFactory();
  final routerFactory = RouterFactory();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseGetUserImageEntity?>(
        initialData: ResponseGetUserImageEntity(null, null, null, null, null, null),
        future: WebClientUserImage().getById(widget._id!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(message: "Carregando");
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (httpHelper.existData(snapshot)) {

                ResponseGetUserImageEntity? data = snapshot.data;

                _controllerFieldUserImageName = TextEditingController(text: data!.fullName);
                _controllerFieldUserImageManager = TextEditingController(text: data.district);

                return buildScaffold(data.fullName);
              }
          }
          return centeredMessageFactory.unknowError();
        });
  }

  buildScaffold(text) => Scaffold(
  appBar: AppBar(backgroundColor: primaryColor,
  title: Text(text)),
  body: buildBody(),
    floatingActionButton: buildFloatingButton(context),
  );


buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        buildInputName(),
        buildPostalCode(),
        //_buttonSelectState,
        //_buttonSelectCity,
        buildInputDistrict(),
        buildInputStreet(),
        buildInputNumber(),
        //_buttonSelectOperationType,
        buildInputFullValue(),
        buildInputManager(),
        buildInputDescription()
      ],
    ),
  );
}


buildInputName()  => FieldInput(
    controller: _controllerFieldUserImageName,
    text: _fieldTextUserImageName);

buildPostalCode()  => FieldInput(
    controller: _controllerFieldUserImagePostalCode,
    text: _fieldTextUserImagePostalCode,
    hint: _fieldHintUserImagePostalCode);

buildInputDistrict() => FieldInput(
    controller: _controllerFieldUserImageDistrict,
    text: _fieldTextUserImageAddressDistrict,
    hint: _fieldHintUserImageDistrict);

buildInputStreet() => FieldInput(
    controller: _controllerFieldUserImageStreet,
    text: _fieldTextUserImageAddressStreet,
    hint: _fieldHintUserImageStreet);

buildInputNumber()  => FieldInput(
    controller: _controllerFieldUserImageNumber,
    text: _fieldTextUserImageAddressNumber);


buildInputFullValue() => FieldInput(
    controller: _controllerFieldUserImageFullValue,
    text: _fieldTextUserImageFullValue,
    hint: _fieldHintUserImageFullValue,
    keyboardType: TextInputType.number);


buildInputManager()  => FieldInput(
    controller: _controllerFieldUserImageManager,
    text: _fieldTextUserImageManager,
    hint: _fieldHintUserImageManager);

buildInputDescription() => FieldInput(controller: _controllerFieldUserImageDescription,
                                      text: _fieldTextUserImageDescription);

buildFloatingButton(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            //TODO - CHAMADA PUT Para alterar dados do imóvel
            routerFactory.navigateTo(context, ScreenConfiguration())
                .then((value) => setState(() {}));
            //navigateToScreen(context, navigateScreenButton).then((value) => setState(() {}));
          },
          child: Icon(Icons.edit),
          tooltip: "Editar",//Icon(Icons.edit)
        ),
        FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {

            routerFactory.navigateTo(context, ScreenUserImagePayment(1))
                .then((value) => setState(() {}));
            //navigateToScreen(context, navigateScreenButton).then((value) => setState(() {}));
          },
          child: Icon(Icons.monetization_on), //Icon(Icons.edit)
          tooltip: "Histórico",
        )
      ],
    );
  }


Future<dynamic> buildActionOnPressed() {
  return showDialog(context: context, builder: (contextDialog) { // Tomar cuidado quando trocar de contexto
    return AuthDialog(onConfirm: (String password) =>
        _postUserImage(context, password));
  });
}


Future<void> _postUserImage(BuildContext context, String password) async {

}

buildPost() =>
    UserImage(null, _controllerFieldUserImageName.text.toString(), null, null);









}







class UserImageDetail extends StatelessWidget {
  final UserImage asset;

  const UserImageDetail({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(asset.name.toString()),
          subtitle: Text(asset.fullValue.toString()),
        ));
  }
}


/*
const _ScreenUserImageDetailTitle = "Detalhes do imovel";

class ScreenUserImageDetail extends StatefulWidget {

  //List<UserImage> _immobile = [];
  UserImage? _immobile = UserImage(null, null, null, null, null, null);

  ScreenUserImageDetail(this._immobile);

  @override
  State<StatefulWidget> createState() {
    return ScreenUserImageDetailState();
  }
}

class ScreenUserImageDetailState extends State<ScreenUserImageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(_ScreenUserImageDetailTitle),
    ),
    body: Text("Detalhe Imovel"));

    /*
    return Scaffold(
        appBar: AppBar(
          title: Text(_ScreenUserImageDetailTitle),
        ),
        body: FutureBuilder<List<ResponseGetUserImageEntity>>(
            future: WebClientUserImage().findAll(),
            builder: (context, snapshot) {


              switch(snapshot.connectionState){

                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress(message: '');
                case ConnectionState.active:
                  break;
                case ConnectionState.done:

                  WebClientHelper httpHelper = WebClientHelper();

                  if(httpHelper.existData(snapshot)){
                    return ListView.builder(
                      itemBuilder: (context, index) => snapshot.data![index].toItem(context),
                      itemCount: snapshot.data?.length);
                    } else {
                      return CenteredMessage("No Contacts found", icon: Icons.warning);
                    }
                  }

                  return CenteredMessage("Unknow error");
              }),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
      //            navigatorToUserImageFormPost(context).then((newUserImage) => _update(newUserImage));
                  //},
                }));

    */
  }
}







class UserImageDetail extends StatelessWidget {
  final UserImage asset;

  const UserImageDetail({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(asset.name.toString()),
          subtitle: Text(asset.fullValue.toString()),
        ));
  }
}

 */