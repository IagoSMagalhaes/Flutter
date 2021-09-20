import 'package:flutter/material.dart';
import 'package:flutter_app/screens/configuration/screen_configuration.dart';
import 'package:flutter_app/screens/user/screen_user_form_post.dart';
import 'package:flutter_app/screens/user/screen_user_list_all.dart';
import 'package:flutter_app/screens/userImage/screen_user_image_list_all.dart';


const primaryColor = Color(0xFF01579B);
const backGroundColor = const Color(0xFFB3E5FC);


class Dashboard extends StatefulWidget {

  @override
  createState() => DashboardState();
}


class DashboardState extends State<Dashboard> {

  int currentIndex = 0;
  final screens = [
                   ScreenUserListAllStatefulAbstract(),
                   ScreenUserForm(),
                   ScreenUserImageListAllStatefulAbstract(),
                   ScreenConfiguration()];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text('User Management')
        ),
        body: buildDashboard(context));


  }

  buildDashboard(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      //body: buildBody(),
      bottomNavigationBar: BottomNavigationBar(
       // type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        iconSize: 50,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: <BottomNavigationBarItem>[
          buildButtonUsers(),
          buildButtonSearch(),
          buildButtonNew(),
          buildButtonUserImage(),
          buildButtonConfig(),
        ],

       // currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }

  buildButtonConfig() =>
      BottomNavigationBarItem(backgroundColor: primaryColor,
                             icon: Icon(Icons.settings, color: Colors.white, size: 24.0), label: 'Configurações');

  buildButtonUserImage() =>
      BottomNavigationBarItem(backgroundColor: primaryColor,
                             icon: Icon(Icons.image, color: Colors.white, size: 24.0), label: 'Imagens');

  buildButtonNew() =>
      BottomNavigationBarItem(backgroundColor: primaryColor,
                             icon: Icon(Icons.add, color: Colors.white, size: 24.0), label: 'Novo');

  buildButtonSearch() =>
      BottomNavigationBarItem(backgroundColor: primaryColor,
                              icon: Icon(Icons.search, color: Colors.white, size: 24.0),label: 'Buscar');

  buildButtonUsers() =>
      BottomNavigationBarItem(backgroundColor: primaryColor,
                             icon: Icon(Icons.contact_page, color: Colors.white, size: 24.0), label: 'Usuarios');



}