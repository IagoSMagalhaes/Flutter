https://flutter.dev/docs/development/ui/widgets/material

https://flutter.dev/docs/development/ui/widgets/cupertino

MaterialApp -> Componente ROOT
Scaffold -> Component BODY

void main() => runApp(MaterialApp(
home: Scaffold(
appBar: AppBar( title: Text("Transferencias"),),
floatingActionButton: FloatingActionButton(
onPressed: () {  },
child: Icon(Icons.access_alarm),),
),
));





Criando seu proprio widget, precisa dar extends


class ListaTransferencias extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Column(
children: [
Card(







Nesta aula, aprendemos:

A implementar um layout com os componentes do Material Design;
Atalhos e dicas para auxiliar a implementação do layout;
Refatorar os próprios Widgets;
O que é StatelessWidget e StatefulWidget;
Organizar e reutilizar código no Flutter.