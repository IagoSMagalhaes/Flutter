import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

const _screenOwnerIsEmpty = "Não existe contados cadastrados";
const _screenAssetIsEmpty = "Não existe patrimônios cadastrados";
const _screenVehicleIsEmpty = "Não existe veículos cadastrados";
const _screenImmobileIsEmpty = "Não existe imóveis cadastrados";
const _unknowError = "Erro desconhecido";




class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double iconSize;
  final double fontSize;

  CenteredMessage(
      this.message, {
        this.icon,
        this.iconSize = 64,
        this.fontSize = 24,
      });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Icon(
              icon,
              size: iconSize,
            ),
            visible: icon != null,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
        ],
      ),
    );
  }
}

class CenteredMessageFactory {

  CenteredMessage ownerIsEmpty() =>
      CenteredMessage(_screenOwnerIsEmpty, icon: Icons.warning);

  CenteredMessage assetIsEmpty() =>
      CenteredMessage(_screenAssetIsEmpty, icon: Icons.warning);

  CenteredMessage unknowError() => CenteredMessage(_unknowError);

  vehicleIsEmpty()  => CenteredMessage(_screenVehicleIsEmpty, icon: Icons.warning);

  immobileIsEmpty()  => CenteredMessage(_screenImmobileIsEmpty, icon: Icons.warning);


}

