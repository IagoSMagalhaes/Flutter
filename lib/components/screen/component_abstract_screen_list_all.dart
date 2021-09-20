import 'package:flutter/material.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/router/factory/router_factory.dart';

import '../../main.dart';
import '../message/component_centered_message.dart';



abstract class ScreenAbstractListAll extends StatefulWidget {

  final AbstractScreenStateListAll screenStateListAll;

  const ScreenAbstractListAll({Key? key, required this.screenStateListAll}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => screenStateListAll;

}



abstract class AbstractScreenStateListAll extends State<ScreenAbstractListAll> {

  abstract final title;

  //abstract Function? onClick;

  //abstract final icon;

  abstract Future<List<AbstractResponse>> future;

  abstract StatefulWidget navigateScreenButton;

  abstract StatefulWidget navigateScreenDetail;

  abstract CenteredMessage centeredMessageWhenIsEmpty;


  final httpHelper = WebClientHelper();
  final centeredMessageFactory = CenteredMessageFactory();
  final routerFactory = RouterFactory();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitle(),
      body: buildBody(),
      floatingActionButton: buildFloatingButton(context),
    );
  }


  AppBar buildTitle() {
    return AppBar(
      title: Text(title),
      backgroundColor: primaryColor,
    );
  }



  FutureBuilder<List<AbstractResponse>> buildBody() {

    return FutureBuilder<List<AbstractResponse>>(
      initialData: [],
      future: future,
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
              return ListView.builder(
                  itemBuilder: (context, index) {
                    AbstractResponse data = snapshot.data![index];

                    return data.toItem();
                    //return data.toItem(buildAction(context));
                    },
                  itemCount: snapshot.data?.length);
            } else {
              return centeredMessageWhenIsEmpty;
            }
        }

        return centeredMessageFactory.unknowError();
      },
    );
  }



  buildAction(BuildContext context) {
    routerFactory.navigateTo(context, navigateScreenDetail)
        .then((value) => setState(() {}));
  }

  buildFloatingButton(BuildContext context) => FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () {
        routerFactory.navigateTo(context, navigateScreenButton)
            .then((value) => setState(() {}));
        //navigateToScreen(context, navigateScreenButton).then((value) => setState(() {}));
      },
      child: Icon(Icons.add),
    tooltip: "Adicionar",
    );
}
















abstract class AbstractItemList extends StatelessWidget {

  final AbstractItem item;

  abstract final icon;

  final Function? onClick;

  const AbstractItemList({Key? key, required this.item, this.onClick}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        onTap: () => onClick!(),
          //onTap: () => (){print("apertei");},
          onTap: () => (){RouterFactory().navigateToScreenConfiguration(context);},
        title: buildTitle(),
        subtitle: buildSubTitle(),
        leading: icon
      ),
    );
  }

  Text buildSubTitle() {
    return Text(
      item.subTitle!,
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Text buildTitle() {
    return Text(
      item.title!,
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}


abstract class AbstractDomain {
  abstract  int? id;
  abstract  String? name;
}



abstract class AbstractItem extends StatelessWidget {

  final int? id;
  final String? title;
  final String? subTitle;
  final Icon? icon;
  final StatefulWidget? onClickNavigateTo;

  AbstractItem(this.id, this.title, this.subTitle, this.icon, this.onClickNavigateTo);

  //AbstractItem toItem();

  @override
  Widget build(BuildContext context) {

    return TextButton(onPressed: () => RouterFactory().navigateTo(context, onClickNavigateTo!),
      style: ButtonStyle(enableFeedback: false),
      child: Card(
        child: ListTile(
            title: buildTitle(),
            subtitle: buildSubTitle(),
            leading: icon
        ),
      ),);
    /*
    return Card(
      child: ListTile(
        //onTap: () => onClick!(),
       // onTap: () => (){print("apertei");},
        onTap: () => (){RouterFactory().navigateToScreenConfiguration(context);},
        title: buildTitle(),
        subtitle: buildSubTitle(),
        leading: icon
      ),
    );

     */
  }

  Text buildTitle() {
    return Text(
      title.toString(),
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }

  Text buildSubTitle() {
    return Text(
      subTitle.toString(),
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

}




abstract class AbstractResponse {

  AbstractItem toItem();

}