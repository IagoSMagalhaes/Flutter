// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/field_input.dart';
import 'package:flutter_app/http/asset/owner/http_owner.dart';
import 'package:flutter_app/models/owner/owner.dart';

const _titulo = "Criar Contato";

const _fieldTextOwnerName = "Nome";
const _fieldTextOwnerCellphone = "Telefone";

const _fieldHintOwnerCellphone = "(00) 0 0000-0000)";

const _textButton = "Confirmar";

class ScreensOwnerForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScreensOwnerFormState();
  }
}

class ScreensOwnerFormState extends State<ScreensOwnerForm> {
  final TextEditingController _controllerFieldOwnerName =
      TextEditingController();
  final TextEditingController _controllerFieldOwnerCellphone =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildInputName(),
            buildInputCellphone(),
            buildInputSend()
          ],
        ),
      ),
      appBar: AppBar(title: Text(_titulo)),
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

  ElevatedButton buildInputSend()  =>
      ElevatedButton(onPressed: () => _saveOwner(context),
                     child: Text(_textButton));




  void _saveOwner(BuildContext context) {
    //TODO - TRANSFORMAR STRING PRA ENUM

    if (_controllerFieldOwnerName.value != null) {
      Owner ownerSave = Owner(null, _controllerFieldOwnerName.text,
          _controllerFieldOwnerCellphone.text);

      if (ownerSave.name != null) {
        //Fazer em uma linha só
        List<RequestPostOwnerEntity> body = [
          RequestPostOwnerEntity(ownerSave.name, ownerSave.cellphone)
        ];

        HttpOwner().post(body).then((value) =>
            Navigator.pop(context, ownerSave));
      }
    }
  }

}
