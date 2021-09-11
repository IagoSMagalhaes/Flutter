import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/loading/progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/centered_message.dart';










/// This is the stateful widget that the main application instantiates.
class ButtonSelected extends StatefulWidget {

  String? defaultValue;

  final List<String> options;

  final String? hint;


  ButtonSelected({Key? key, this.defaultValue, required this.options, required this.hint}) : super(key: key);

  @override
  State<ButtonSelected> createState() => ButtonSelectedState();
}

/// This is the private State class that goes with MyStatefulWidget.
class ButtonSelectedState extends State<ButtonSelected> {

  @override
  Widget build(BuildContext context) {

    return DropdownButton<String>(
      value: widget.defaultValue != null ? widget.defaultValue.toString() : null,
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
          child: Text(value)
        );
      }).toList(),
    );

    /*
    return AppBar(
      title: Row(
        //  mainAxisSize: MainAxisSize.min,
       //   mainAxisAlignment: MainAxisAlignment.center,
          children: [DropdownButton<String>(
*/
  }

  void buildOnChanged(String? newValue) {
      setState(() {
        widget.defaultValue = newValue!;
      });
    }

  Text buildHint() {
    String hint = widget.hint != null ? widget.hint.toString() : "";
    return Text(hint, style: TextStyle(fontSize: 25));
  }
}



class ButtonSelectedTest extends StatefulWidget {

  String? defaultValue;

  final List<String> options;

  final String? hint;


  ButtonSelectedTest({Key? key, this.defaultValue, required this.options, required this.hint}) : super(key: key);

  @override
  State<ButtonSelectedTest> createState() => ButtonSelectedStateTest();
}

/// This is the private State class that goes with MyStatefulWidget.
class ButtonSelectedStateTest extends State<ButtonSelectedTest> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text')),
      body: Column(
        children: [
          Text('test'),
          Expanded(
            child: DropdownButton<String>(
              value: widget.defaultValue != null ? widget.defaultValue.toString() : null,
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
                    child: Text(value)
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


  void buildOnChanged(String? newValue) {
    setState(() {
      widget.defaultValue = newValue!;
    });
  }

  Text buildHint() {
    String hint = widget.hint != null ? widget.hint.toString() : "";
    return Text(hint, style: TextStyle(fontSize: 25));
  }
}