
// Componente Abstrato
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class FieldInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final String? hint;
  final IconData? icone;
  final double? padding;
  final TextInputType? keyboardType;

  const FieldInput({Key? key, this.controller, this.text, this.hint, this.icone, this.padding, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: buildEdge(),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: text,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }

  EdgeInsetsGeometry buildEdge() {

    if(padding != null)
      return EdgeInsets.all(padding!);

    return const EdgeInsets.all(16.0);
  }

  TextInputType? buildKeyBoard() {

    if(keyboardType != null)
      return keyboardType;

    return TextInputType.text;
  }
}

