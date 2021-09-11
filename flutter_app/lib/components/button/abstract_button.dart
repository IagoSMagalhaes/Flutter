import 'package:flutter/material.dart';
import 'package:flutter_app/components/auth/asset_auth_dialog.dart';
import 'package:flutter_app/components/loading/progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/router/factory/router_factory.dart';


import '../message/centered_message.dart';





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