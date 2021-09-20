import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/http/webclients/domain/webclient_domain.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/component_centered_message.dart';




/// This is the stateful widget that the main application instantiates.
class ButtonSelected extends StatefulWidget {

  String? valueSelected;

  final List<String> options;

  final String hint;

  final String? labelText;

  ButtonSelected({Key? key, this.valueSelected, required this.options, required this.hint, this.labelText}) : super(key: key);

  @override
  State<ButtonSelected> createState() => ButtonSelectedState();
}

/// This is the private State class that goes with MyStatefulWidget.
class ButtonSelectedState extends State<ButtonSelected> {

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(border: OutlineInputBorder()),
                                  child: buildDropDownButton());
  }


  InputDecorator buildDropDownButton() {
    return InputDecorator(
    decoration: InputDecoration(border: OutlineInputBorder(),
    labelText: widget.labelText != null ? widget.labelText : widget.hint,
    labelStyle: TextStyle(fontSize: 24)),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: widget.valueSelected != null ? widget.valueSelected.toString() : null,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        hint: buildHint(),
        // style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 12,
          //color: Colors.deepPurpleAccent,
        ),
        onChanged: buildOnChanged,
        style: TextStyle(fontSize: 24.0),
        items: widget.options
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
  }

  void buildOnChanged(String? newValue) {
    setState(() {
      widget.valueSelected = newValue!;
    });
  }

  Text buildHint() {
    String hint = widget.hint != null ? widget.hint.toString() : "";
    return Text(hint, style: TextStyle(fontSize: 25));
  }
}