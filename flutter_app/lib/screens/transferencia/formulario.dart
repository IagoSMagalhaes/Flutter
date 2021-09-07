

// Criando formulario
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/editor.dart';
import 'package:flutter_app/models/transferencia.dart';


const _titulo = "Criando transferencia";

const _rotuloCampoValor = "Valor";
const _dicaCampoValor = "0.00";

const _rotuloCampoNumeroConta = "Número da conta";
const _dicaCampoNumeroConta = "000-0000";

const _textoBotao = "Confirmar";

class FormularioTransacoes extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransacoesState();
  }
}



class FormularioTransacoesState extends State<FormularioTransacoes>{


  final TextEditingController _controllerCampoNumeroConta = TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controlador: _controllerCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
            ),
            Editor(
              controlador: _controllerCampoValor,
              rotulo: _rotuloCampoValor,
              dica: _dicaCampoValor,
            ),
            RaisedButton(
                onPressed: () => _criaTransferencia(context),
                child: Text(_textoBotao))
          ],
        ),
      ),
      appBar: AppBar(title: Text(_titulo)),
    );
  }

  void _criaTransferencia(BuildContext context) {

    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);

    final double? valor = double.tryParse(_controllerCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      print(transferenciaCriada);
      Navigator.pop(context, transferenciaCriada);
    }
  }

}
