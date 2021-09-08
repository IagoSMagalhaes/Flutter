import 'package:flutter/material.dart';
import 'package:flutter_app/components/loading/progress.dart';
import 'package:flutter_app/http/helper/helper/http_helper.dart';
import 'package:flutter_app/models/owner/domain/owner.dart';


import '../message/centered_message.dart';



abstract class ScreenAbstractListAll extends StatefulWidget {

  final AbstractScreenStateListAll screenStateListAll;

  const ScreenAbstractListAll({Key? key, required this.screenStateListAll}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => screenStateListAll;

}



abstract class AbstractScreenStateListAll extends State<ScreenAbstractListAll> {

  abstract final title;

  //abstract final icon;

//  abstract final AbstractItem item;

  abstract Future<List<AbstractResponse>> future;

  abstract StatefulWidget navigateScreenButton;


  final httpHelper = HttpHelper();
  final centeredMessageFactory = CenteredMessageFactory();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitle(),
      body: buildBody(),
      floatingActionButton: buildActionButton(context),
    );
  }


  AppBar buildTitle() {
    return AppBar(
      title: Text(title),
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
            return Progress();
            break;
          case ConnectionState.active:
            break;
          case ConnectionState.done:
            print("20");
            if(httpHelper.existData(snapshot)){
              return ListView.builder(

                  itemBuilder: (context, index) {

                    print("1");
                    AbstractResponse data = snapshot.data![index];
                    print("2");
                    return data.toItem();
                    },
                  itemCount: snapshot.data?.length);
            } else {
              return centeredMessageFactory.ownerIsEmpty();
            }
        }

        return centeredMessageFactory.unknowError();
      },
    );
  }



  FloatingActionButton buildActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        navigateToScreen(context, navigateScreenButton).then((value) => setState(() {}));
      },
      child: Icon(Icons.add),
    );
  }




  Future<dynamic> navigateToScreen(BuildContext context, StatefulWidget screenNavigate) {
    return Navigator.of(context).push(MaterialPageRoute(builder: (context) => screenNavigate));
  }
}
















abstract class AbstractItemList extends StatelessWidget {

  final AbstractItem item;

  abstract final icon;

  const AbstractItemList({Key? key, required this.item}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
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

  final String? title;
  final String? subTitle;
  final Icon? icon;

  AbstractItem(this.title, this.subTitle, this.icon);

  //AbstractItem toItem();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: buildTitle(),
        subtitle: buildSubTitle(),
        leading: icon
      ),
    );
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