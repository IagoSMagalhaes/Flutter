import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/loading/progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/centered_message.dart';










/// This is the stateful widget that the main application instantiates.
class ButtonSelected extends StatefulWidget {

  late String defaultValue;

  final List<String> options;


  ButtonSelected({Key? key, required this.defaultValue, required this.options}) : super(key: key);

  @override
  State<ButtonSelected> createState() => ButtonSelectedState();
}

/// This is the private State class that goes with MyStatefulWidget.
class ButtonSelectedState extends State<ButtonSelected> {

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.defaultValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          widget.defaultValue = newValue!;
        });
      },
      items: widget.options
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}




/*
class ButtonPost {

  ElevatedButton buildButtonPost(context, textButton, onPost) {
    return ElevatedButton(onPressed: () =>
        showDialog(context: context, builder: (contextDialog){
          return AuthDialog(onConfirm: (String password) {
            print(password);
            onPost(context, password);
          },);
        }),
        //ElevatedButton(onPressed: () => _saveOwner(context),
        child: Text(textButton));
  }
}

 */