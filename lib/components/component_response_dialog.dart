import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String buttonText;
  final IconData? icon;
  final Color colorIcon;

  ResponseDialog({
    this.title = "",
    this.message = "",
    this.icon,
    this.buttonText = 'Ok',
    this.colorIcon = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Visibility(
        child: Text(title!),
        visible: title!.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(
                icon,
                size: 64,
                color: colorIcon,
              ),
            ),
            visible: icon != null,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          child: Text(buttonText),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
  }
}





class SuccessDialog extends StatelessWidget {
  final String? title = "Sucesso!";
  final String? message;
  IconData? icon;

  SuccessDialog({Key? key, this.message, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message!,
      icon: icon == null ? Icons.done : null,
      colorIcon: Colors.green,
    );
  }

  Future<void> showDialogSuccess(BuildContext context, String messageSuccess) async {
    await showDialog(
        context: context,
        builder: (contextDialog) {
          return SuccessDialog(message: messageSuccess);
        }).then((value) => Navigator.pop(context));
  }

}




class FailureDialog extends StatelessWidget {
  String? title = "Erro!";
  String? message;
  IconData? icon;

  FailureDialog({Key? key, this.message, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message!,
      icon: icon == null ? Icons.error : null,
      colorIcon: Colors.red,
    );
  }

  void showDialogError(BuildContext context, exception) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message: exception.toString());
    });
  }

  void showDialogErrorMessage(BuildContext context) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message: message);
    });
  }

  void showUnknowError(BuildContext context) {
    showDialog(context: context, builder: (contextDialog) {
      return FailureDialog(message: "Erro não esperado");
    });
  }
}
