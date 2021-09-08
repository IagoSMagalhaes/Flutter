import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/centered_message.dart';
import 'package:flutter_app/components/progress.dart';
import 'package:flutter_app/http/asset/asset/http_asset.dart';
import 'package:flutter_app/models/asset/asset.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/router/asset/asset_list_all_router.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';

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
        appBar: AppBar(
          title: Text(_screenAssetListTitle),
        ),
        body: FutureBuilder<List<ResponseAssetEntity>>(
            initialData: [],
            future: HttpAsset().findAllAssets(),
          //  future: Future.delayed(Duration(seconds: 1)).then((value) => HttpAsset().findAllAssets()),
            builder: (context, snapshot) {

              switch(snapshot.connectionState){
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                case ConnectionState.done:

                  if(snapshot.hasData){

                    final List<ResponseAssetEntity>? assets = snapshot.data;

                    if(assets != null && assets.isNotEmpty){

                      return ListView.builder(
                        itemBuilder: (context, index) {

                          ResponseAssetEntity indexAsset = assets[index];

                          final Asset assetSave = Asset(id: indexAsset.id, name: indexAsset.name, manager: indexAsset.name);

                          return AssetItemList(asset: assetSave, onClick: _navigateToScreenAssetDetail);
                        },
                        itemCount: assets.length,
                      );
                    }
                  } else {
                    return CenteredMessage("No Assets found", icon: Icons.warning);
                  }
                }
                  return CenteredMessage("Unknow error");
              }),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            navigatorToAssetFormPost(context).then((newAsset) => _update(newAsset));
          },
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



void _navigateToScreenAssetDetail(context) => _navigateTo(context,  ScreenAssetList());

//Icon _iconScreenAssetDetail() => Icon(Icons.search, color: Colors.white, size: 24.0);

void _navigateTo(context, StatefulWidget statefulWidget) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => statefulWidget,
    ));







// Abstração Item da lista
class AssetItemList extends StatelessWidget {
  final Asset asset;
  final Function onClick;

  const AssetItemList({Key? key, required this.asset, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          onTap: () => onClick(),
      leading: Icon(Icons.monetization_on),
      title: Text(asset.name.toString()),
      subtitle: Text(asset.fullValue.toString()),
    ));
  }
}



