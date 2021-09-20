import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/component_asset_auth_dialogt.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/component_centered_message.dart';





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