import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard/dashboard.dart';

class NavigateScreen extends StatelessWidget {
  String text;
  TextStyle? textStyle;
  final Icon icon;
  Function? onClick;
  double? height;
  double? width;
  double? paddingWithItens;

  NavigateScreen({Key? key, required this.text, this.textStyle, required this.icon,
    this.onClick, this.height, this.width, this.paddingWithItens}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: paddingWithItens != null ? EdgeInsets.all(paddingWithItens!) : const EdgeInsets.all(8.0),
      child: Material(
        color: primaryColor,
        child: InkWell(
          onTap: () {
            onClick!();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: height != null ? height : 120,
            width: width != null ? width : 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                icon,
                Text(
                  text,
                  style: textStyle != null ? textStyle : TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
}
