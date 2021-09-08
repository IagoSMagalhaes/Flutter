import 'package:flutter/material.dart';
import 'package:flutter_app/components/progress.dart';
import 'package:flutter_app/http/asset/owner/http_owner.dart';
import 'package:flutter_app/models/owner/owner.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';


class ScreenOwnerList extends StatefulWidget {

  @override
  _ScreenOwnerListState createState() => _ScreenOwnerListState();
}

class _ScreenOwnerListState extends State<ScreenOwnerList> {
  //final OwnerAsset _dao = OwnerAssetDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<ResponseOwnerEntity>>(
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
              final List<ResponseOwnerEntity>? owner = snapshot.data;
              //final List<OwnerAsset>? owner = snapshot.data;
              return ListView.builder(

                itemBuilder: (context, index) {
                  final Owner ownerSave = owner![index] as Owner;

                  return _OwnerAssetItem(ownerSave);
                },
                itemCount: owner?.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToOwnerPost(context).then((value) => setState(() {}));
          },
        child: Icon(Icons.add,),
      ),
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

class _OwnerAssetItem extends StatelessWidget {

  final Owner owner;

  _OwnerAssetItem(this.owner);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          owner.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          owner.cellphone.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}

