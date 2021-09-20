

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AbstractGridView extends StatelessWidget {


  final List<AbstractItemGridView> itens;

  const AbstractGridView({Key? key, required this.itens}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 20, crossAxisCount: 3),
        itemCount: itens.length,
        itemBuilder: (context, index) => Card(
          shadowColor: Colors.amber,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: buildBoxDecoration(),
              child: Column(
                children: [
                  itens[index],
                  // item,
                  SizedBox(height: 12),
               //   textButton!
                ],
              ),
            ),
          ),
        ));

  }

  BoxDecoration buildBoxDecoration() =>
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),
                   gradient: LinearGradient(colors: [Colors.indigo, Colors.black],
                                             begin: Alignment.topLeft, end: Alignment.bottomRight));
  }



class AbstractItemGridView extends StatelessWidget {

  final String? title;
  final String? subTitle;
  final String? description;
  final TextButton? textButton;

  const AbstractItemGridView(
      {Key? key, this.title, this.description, this.textButton, this.subTitle})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title!, style: TextStyle(fontSize: 22, color: Colors.white54)),
        SizedBox(height: 20),
        Text(subTitle!, style: TextStyle(fontSize: 20, color: Colors.white54)),
        SizedBox(height: 40),
        Text(description!, style: TextStyle(fontSize: 14, color: Colors.white54)),
        SizedBox(height: 30),
        textButton!
      ],);
  }
}

