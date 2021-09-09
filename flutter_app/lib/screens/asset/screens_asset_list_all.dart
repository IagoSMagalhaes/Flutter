import 'package:flutter_app/components/message/centered_message.dart';
import 'package:flutter_app/components/screen/abstract_screen.dart';
import 'package:flutter_app/http/webclients/asset/asset/webclient_asset.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_post.dart';





class ScreenAssetListAllStatefulAbstract extends ScreenAbstractListAll {

  ScreenAssetListAllStatefulAbstract() : super(screenStateListAll: ScreenAssetListAllStateAbstract());

}

class ScreenAssetListAllStateAbstract extends AbstractScreenStateListAll {

  @override
  Future<List<AbstractResponse>> future = WebClientAsset().findAllAssets();

  @override
  get title => "Patrimônios";

  @override
  get navigateScreenButton => ScreensAssetForm();

  @override
  get centeredMessageWhenIsEmpty => CenteredMessageFactory().assetIsEmpty();

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

}

























/*



const _screenAssetListTitle = "Patrimônios";

class ScreenAssetList extends StatefulWidget {
  List<Asset> _assets = [];

  @override
  State<StatefulWidget> createState() {
    return ScreenAssetListState();
  }
}

class ScreenAssetListState extends State<ScreenAssetList> {

  HttpHelper httpHelper = HttpHelper();
  CenteredMessageFactory centeredMessageFactory = CenteredMessageFactory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildTitle(),
        body: buildBody(),
        floatingActionButton: buildActionButton(context));
  }



  AppBar buildTitle() {
    return AppBar(
      title: Text(_screenAssetListTitle),
    );
  }

  FutureBuilder<List<ResponseGetAssetEntity>> buildBody() {
    return FutureBuilder<List<ResponseGetAssetEntity>>(
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

              if(httpHelper.existData(snapshot)){
                return ListView.builder(
                    itemBuilder: (context, index) => snapshot.data![index].toAssetItem(),
                    itemCount: snapshot.data?.length);
              } else {
                return centeredMessageFactory.assetIsEmpty();
              }
          }
          return centeredMessageFactory.unknowError();
        });
  }




  FloatingActionButton buildActionButton(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          navigatorToAssetFormPost(context).then((newAsset) => _update(newAsset));
        },
      );
  }






  void _update(Asset asset) {
    if (asset != null) {
      setState(() {
        widget._assets.add(asset);
      });
    }
  }
}



//void _navigateToScreenAssetDetail(context) => _navigateTo(context,  ScreenAssetList());
//Icon _iconScreenAssetDetail() => Icon(Icons.search, color: Colors.white, size: 24.0);
//void _navigateTo(context, StatefulWidget statefulWidget) => Navigator.of(context).push(
//    MaterialPageRoute(
//      builder: (context) => statefulWidget,
//    ));







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





 */