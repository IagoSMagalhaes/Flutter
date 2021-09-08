import 'package:flutter/material.dart';
import 'package:flutter_app/components/centered_message.dart';
import 'package:flutter_app/components/progress.dart';
import 'package:flutter_app/http/asset/owner/http_owner.dart';
import 'package:flutter_app/models/owner/owner.dart';
import 'package:flutter_app/screens/owner/screens_owner_form_post.dart';

const _screenOwnerListTitle = "Contatos";

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
        title: Text(_screenOwnerListTitle),
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

              if (snapshot.hasData) {
                if (owner != null && owner.isNotEmpty) {
                  return ListView.builder(
                    itemBuilder: (context, index) {

                      ResponseOwnerEntity indexOwner = owner[index];

                      final Owner ownerSave = Owner(indexOwner.id, indexOwner.name, indexOwner.cellphone);

                      return _OwnerAssetItem(ownerSave);
                      },
                    itemCount: owner.length,
                  );
                }
              } else {
                return CenteredMessage("No Contacts found",
                    icon: Icons.warning);
              }
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToOwnerPost(context).then((value) => setState(() {}));
        },
        child: Icon(
          Icons.add,
        ),
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
          owner.name!,
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
