

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_detail.dart';


const primaryColor = Color(0xFF01579B);




abstract class ScreenAbstractListAllImage extends StatefulWidget {

  final AbstractScreenStateListAllImage screenStateListAllImage;

  const ScreenAbstractListAllImage({Key? key, required this.screenStateListAllImage}) : super(key: key);

  @override
  State<StatefulWidget> createState()  => screenStateListAllImage;

}


abstract class AbstractScreenStateListAllImage extends State<ScreenAbstractListAllImage> {

  abstract List<AbstractItemListView> items;


  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(backgroundColor: secondColor,title: Text("Imóveis"), centerTitle: true,),
        body: ListView.builder(padding: EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InputDecorator(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  child: buildBody(item, index, context));
            })
    );
  }

  buildBody(AbstractItemListView item, int index, BuildContext context) {

    return TextButton(
      onPressed: () => RouterFactory().navigateTo(context, item.onClickNavigateTo!),
      style: ButtonStyle(enableFeedback: false),
      child: GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => AbstractScreenStateListAllImageOnClick(item: item))),
          child: Row(children: [
            Hero(tag: item,
                transitionOnUserGestures: true,
                child: buildImage(item.urlImage!)),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(item.title!),
                const SizedBox(height: 32),
                Text(item.description!)
              ],
            ),
          ])),);
  }

  buildImage(String urlImage) =>
      Image.network(urlImage,
        fit: BoxFit.cover,
        width: 150,
        height: 150,);
}



class AbstractScreenStateListAllImageOnClick extends StatelessWidget {

  final AbstractItemListView item;

  AbstractScreenStateListAllImageOnClick({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: primaryColor,title: Text(item.title!), centerTitle: true,),
        body: Hero(child: buildImage(), tag: item, transitionOnUserGestures: true)
    );
  }

  buildImage() => AspectRatio(aspectRatio: 1, child: Image.network(item.urlImage!,
      fit: BoxFit.cover,
      width: 150,
      height: 150));
}




class AbstractItemListView {

  int? id;
  String? title;
  String? description;
  String? urlImage;
  StatefulWidget? onClickNavigateTo;

  AbstractItemListView(
      this.id,
      this.title,
      this.description,
      this.urlImage,
      this.onClickNavigateTo);

}












/*


class AbstractListViewImage extends StatelessWidget {

  final items = <AbstractItemListView>[
    AbstractItemListView(1, "Casa terrea Gopouva 120m2", "Responsável: Hugo", "http://localhost:8081/immobile/v1/image/1", ScreenUserImageDetail(1)),
    AbstractItemListView(2, "Sobrado Bosque Maia 70m2", "Responsável: Wagner", "http://localhost:8081/immobile/v1/image/2", ScreenUserImageDetail(2)),
    AbstractItemListView(3, "Casa terrea Macedo 90m2", "Responsável: Hugo", "http://localhost:8081/immobile/v1/image/3", ScreenUserImageDetail(3)),
  ];

  AbstractListViewImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: secondColor,title: Text("Imóveis"), centerTitle: true,),
        body: ListView.builder(padding: EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InputDecorator(
                  decoration: InputDecoration(border: OutlineInputBorder()),
                  child: buildBody(item, index, context));
            })
    );
  }

  buildBody(AbstractItemListView item, int index, BuildContext context) {

    return TextButton(
      onPressed: () => RouterFactory().navigateTo(context, item.onClickNavigateTo!),
      style: ButtonStyle(enableFeedback: false),
      child: GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder:(context) => Screen2(item: item))),
          child: Row(children: [
            Hero(tag: item,
                transitionOnUserGestures: true,
                child: buildImage(item.urlImage!)),
            const SizedBox(width: 16),
            Column(
              children: [
                Text(item.title!),
                const SizedBox(height: 32),
                Text(item.description!)
              ],
            ),
          ])),);
  }

  buildImage(String urlImage) =>
      Image.network(urlImage,
        fit: BoxFit.cover,
        width: 150,
        height: 150,);
}


 */