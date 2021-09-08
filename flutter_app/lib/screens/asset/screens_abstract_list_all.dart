

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/asset/asset.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';
import 'package:flutter_app/screens/asset/screens_asset_list_all.dart';
/*


const _screenAssetListTitle = "Patrimônios";



class TesteAbstractScreen extends ScreenAbstractListAll {
  TesteAbstractScreen() : super(buildAssets(), AssetItemList(asset: null,));
  
}

 List<Asset> buildAssets() {
  return [Asset()];
 }






abstract class ScreenAbstractListAll extends StatefulWidget {

  //final StatefulWidget _assets;
  final List<Object> _itens;
  final StatelessWidget _itemList;

  const ScreenAbstractListAll(this._itens, this._itemList) : super();

  @override
  State<StatefulWidget> createState() {
    return ScreenAssetListState();
  }

}

abstract class ScreenAbstractStateListAll extends State<ScreenAbstractListAll> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder( //ListView -> Usado com valores dinamicos

          itemCount: widget._itens.length,

          itemBuilder: (context, index) {

            final asset = widget._itens[index];

            return widget._itemList;
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              print("passando para salvar");

              return ScreensAssetForm();
            }));
            // })).then((newAsset) => _update(newAsset));


            print("terminei o add");
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(

          title: Text(_screenAssetListTitle),
        ));
  }
}




 */

