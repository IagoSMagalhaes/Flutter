import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/components/loading/progress.dart';
import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/http/helper/helper/http_helper.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/models/asset/domain/asset.dart';
import 'package:flutter_app/models/asset/dto/response/response_get_asset_entity.dart';

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
        body: FutureBuilder<List<ResponseGetAssetEntity>>(
            future: WebClientAsset().findAllAssets(),
            builder: (context, snapshot) {


              switch(snapshot.connectionState){

                case ConnectionState.none:
                  break;
                case ConnectionState.waiting:
                  return Progress();
                case ConnectionState.active:
                  break;
                case ConnectionState.done:

                  HttpHelper httpHelper = HttpHelper();

                  if(httpHelper.existData(snapshot)){
                    return ListView.builder(
                      itemBuilder: (context, index) => snapshot.data![index].toItem(),
                      itemCount: snapshot.data?.length);
                    } else {
                      return CenteredMessage("No Contacts found", icon: Icons.warning);
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