
// Criando lista de transferencias HOME
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/screens/transferencia/formulario.dart';

class ListaTransferencias extends StatefulWidget {

  List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}


class ListaTransferenciaState extends State<ListaTransferencias> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder( //ListView -> Usado com valores dinamicos
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) {
            final transferencia = widget._transferencias[index];
            return ItemTransferencia(transferencia: transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormularioTransacoes();
            })).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));

          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text("Transferencias"),
        ));
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }

}



// Abstração Item da lista
class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({Key? key, required this.transferencia})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text(transferencia.valor.toString()),
          subtitle: Text(transferencia.numeroConta.toString()),
        ));
  }
}