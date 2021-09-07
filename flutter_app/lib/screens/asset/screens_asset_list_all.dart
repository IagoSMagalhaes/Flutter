import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/asset.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/router/asset/asset_list_all_router.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_save.dart';

const _screenAssetListTitle = "Patrimônios";

class ScreenAssetList extends StatefulWidget {
  List<Asset> _assets = [];

  @override
  State<StatefulWidget> createState() {
    return ScreenAssetListState();
  }
}

class ScreenAssetListState extends State<ScreenAssetList> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ListView.builder(
          //ListView -> Usado com valores dinamicos
          itemCount: widget._assets.length,

          itemBuilder: (context, index) {
            final asset = widget._assets[index];
            return AssetItemList(asset: asset);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigatorToAssetFormPost(context).then((newAsset) => _update(newAsset));
          },
        ),
        appBar: AppBar(
          title: Text(_screenAssetListTitle),
        ));
  }

  void _update(Asset asset) {
    if (asset != null) {
      setState(() {
        widget._assets.add(asset);
      });
    }
  }
}

// Abstração Item da lista
class AssetItemList extends StatelessWidget {
  final Asset asset;

  const AssetItemList({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(asset.name.toString()),
      subtitle: Text(asset.fullValue.toString()),
    ));
  }
}
