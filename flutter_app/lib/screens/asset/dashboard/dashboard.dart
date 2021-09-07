
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/asset/screens_asset_form_save.dart';

import '../screens_asset_list_all.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: buildDashboard(context));



  Padding buildDashboard(context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildBody(),
          buildFooter(context),
        ],
      ),
    );



  buildBody()  => Padding(
      padding: const EdgeInsets.all(100.0),
      child: Image.asset('images/logo.gif'),
      //child: Image.asset('images/asset-management.png'),
    );



  buildFooter(context) => Container(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
        children: [
          buildSearch(context),
          buildPost(context)]),
  );

  ItemDashboard buildSearch(context) => ItemDashboard(name: "Buscar",
                                                      icon: _iconScreenAssetList(),
                                                      onClick: () => _navigateToScreenAssetList(context));

  buildPost(context) => ItemDashboard(name: "Novo",
                                      icon: _iconScreenAssetFormPost(),
                                      onClick: () => _navigateToScreenAssetFormPost(context));

}





class ItemDashboard extends StatelessWidget {

  final String name;
  final Icon icon;
  final Function onClick;

  const ItemDashboard({Key? key, required this.name, required this.icon, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                icon,
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}







//NAVIGATE

Icon _iconScreenAssetFormPost() => Icon(Icons.add, color: Colors.white, size: 24.0);

Icon _iconScreenAssetList() => Icon(Icons.search, color: Colors.white, size: 24.0);

void _navigateToScreenAssetList(context) => _navigateTo(context,  ScreenAssetList());

void _navigateToScreenAssetFormPost(context) => _navigateTo(context,  ScreensAssetForm());

void _navigateTo(context, StatefulWidget statefulWidget) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => statefulWidget,
    ));





