
import 'package:flutter/material.dart';



class AuthDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  AuthDialog({required this.onConfirm});



  @override
  State<AuthDialog> createState() => _AuthDialogState();
}



class _AuthDialogState extends State<AuthDialog> {

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: buildTitle(),
        content: buildContent(),
      actions: [
        buildButtonConfirm(),
        buildButtonCancel(),
      ],
    );
  }

  TextField buildContent() => TextField(
    controller: _passwordController,
    obscureText: true, // Esconder
    maxLength: 4,
    decoration: InputDecoration(   //BORDA
      border: OutlineInputBorder()
    ),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: 52, letterSpacing: 24));
  Text buildTitle() => Text("Autenticação");

  FlatButton buildButtonConfirm() => FlatButton(onPressed: () {
    widget.onConfirm(_passwordController.text);
    Navigator.pop(context);
    }, child: Text("Confirmar"),);

  FlatButton buildButtonCancel() => FlatButton(onPressed: () {print("Cancelar");}, child: Text("Cancelar"),);
}
