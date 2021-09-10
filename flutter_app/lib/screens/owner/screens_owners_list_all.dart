import 'package:flutter/material.dart';
import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen_list_all.dart';
import 'package:flutter_app/http/webclients/asset/owner/webclient_owner.dart';
import 'package:flutter_app/models/owner/domain/owner.dart';
import 'package:flutter_app/models/owner/dto/response/response_get_owner_entity.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';



class ScreenOwnerListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenOwnerListAllStatefulAbstract() : super(screenStateListAll: ScreenOwnerListAllStateAbstract());

}

class ScreenOwnerListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientOwner().findAll();

  @override
  get title => "Contatos";

  @override
  get navigateScreenButton => ScreenOwnerForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().ownerIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}


























/*

class ScreenOwnerListAllStateful extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenOwnerListAllState();
  }
}



class ScreenOwnerListAllState extends State<ScreenOwnerListAllStateful> {

  @override
  Future<List<AbstractResponse>> future = HttpOwner().findAll();

  @override
  get title => "Contatos";

  //@override
  //AbstractItem get item => throw UnimplementedError();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      //body: buildBody(),
      //floatingActionButton: buildActionButton(context),
    );
  }
}





























const _screenOwnerListTitle = "Contatos";
const _screenOwnerIsEmpty = "Não existe contados cadastrados";
const _unknowError = "Unknown error";




class ScreenOwnerList extends StatefulWidget {
  @override
  ScreenOwnerListState createState() => ScreenOwnerListState();
}



class ScreenOwnerListState extends State<ScreenOwnerList> {
  //final OwnerAsset _dao = OwnerAssetDao();

  HttpHelper httpHelper = HttpHelper();
  CenteredMessageFactory centeredMessageFactory = CenteredMessageFactory();

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
      title: Text(_screenOwnerListTitle),
    );
  }


  FutureBuilder<List<ResponseOwnerEntity>> buildBody() {
    return FutureBuilder<List<ResponseOwnerEntity>>(
      initialData: [],
      future: HttpOwner().findAll(),
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

            if(httpHelper.existData(snapshot)){
              return ListView.builder(
                  itemBuilder: (context, index) => snapshot.data![index].toOwnerItem(),
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
        navigateToOwnerPost(context).then((value) => setState(() {}));
      },
      child: Icon(Icons.add),
    );
  }




  Future<dynamic> navigateToOwnerPost(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ScreensOwnerForm(),
      ),
    );
  }

}


 */















class OwnerItemList extends StatelessWidget {

  final Owner owner;

  OwnerItemList(this.owner);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: buildTitle(),
        subtitle: buildSubTitle(),
      ),
    );
  }

  Text buildSubTitle() {
    return Text(
      owner.cellphone.toString(),
      style: TextStyle(
        fontSize: 16.0,
      ),
    );
  }

  Text buildTitle() {
    return Text(
      owner.name!,
      style: TextStyle(
        fontSize: 24.0,
      ),
    );
  }
}


