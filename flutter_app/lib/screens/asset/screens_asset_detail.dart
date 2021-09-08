import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/centered_message.dart';
import 'package:flutter_app/components/progress.dart';
import 'package:flutter_app/http/asset/asset/http_asset.dart';
import 'package:flutter_app/models/asset/asset.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/router/asset/asset_list_all_router.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';

const _screenAssetDetailTitle = "Detalhes";

class ScreenAssetDetail extends StatefulWidget {
  List<Asset> _assets = [];

  @override
  State<StatefulWidget> createState() {
    return ScreenAssetDetailState();
  }
}

class ScreenAssetDetailState extends State<ScreenAssetDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screenAssetDetailTitle),
        ),
        body: FutureBuilder<List<ResponseAssetEntity>>(
            future: HttpAsset().findAllAssets(),
          //  future: Future.delayed(Duration(seconds: 1)).then((value) => HttpAsset().findAllAssets()),
            builder: (context, snapshot) {

              final List<ResponseAssetEntity>? assets = snapshot.data;
              print("teste4");
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                case ConnectionState.done:
                  print("teste2");
                  if(snapshot.hasData){
                    final List<ResponseAssetEntity>? assets = snapshot.data;
                    print("teste1");
                    if(assets != null && assets.isNotEmpty){
                      print("teste");
                      return ListView.builder(
                        itemCount: widget._assets.length,
                        itemBuilder: (context, index) {
                          final asset = widget._assets[index];
                          return AssetDetail(asset: asset);
                        },
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
//            navigatorToAssetFormPost(context).then((newAsset) => _update(newAsset));
            //},
          }));
  }
}







class AssetDetail extends StatelessWidget {
  final Asset asset;

  const AssetDetail({Key? key, required this.asset}) : super(key: key);

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