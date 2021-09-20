import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/http/webclients/domain/webclient_domain.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/component_centered_message.dart';



class ButtonSelectedDomain extends StatefulWidget {

  String? valueSelected;

  final String hint;

  final String? labelText;

  final String domain;

  ButtonSelectedDomain({Key? key, this.valueSelected, required this.hint, this.labelText, required this.domain}) : super(key: key);

  @override
  State<ButtonSelectedDomain> createState() => ButtonSelectedDomainState();
}


class ButtonSelectedDomainState extends State<ButtonSelectedDomain> {

  final httpHelper = WebClientHelper();
  final centeredMessageFactory = CenteredMessageFactory();
  final routerFactory = RouterFactory();



  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<String>>(
        initialData: [],
        future: WebClientDomain().getOptions(widget.domain),
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

              if(httpHelper.existDataList(snapshot)){

                List<String>? data = snapshot.data;

                return buildInputDecorator(data!);
              }
          }
          return centeredMessageFactory.unknowError();
        });
  }

  InputDecorator buildInputDecorator(List<String> options) {
    return InputDecorator(
        decoration: InputDecoration(border: OutlineInputBorder()),
        child: buildDropDownButton(options));
  }


  InputDecorator buildDropDownButton(List<String> options) {
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
          items: options
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



