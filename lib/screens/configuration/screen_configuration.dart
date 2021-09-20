
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

const _title = "Configurações";
const _all = "Geral";
const _close = "Sair";
const _darkMode = "Modo Escuro";

const _configAccount = 'Configuraçõe da  conta';
const _policySecurityLanguage = "Privacidade, Segurança, Language";
const _privacity = "Privacidade";
const _security = "Segurança";
const _info = "Informações";
const _alterPassword = "Trocar Senha";




class ScreenConfiguration extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenConfigurationState();
  }
}


class ScreenConfigurationState extends State<ScreenConfiguration> {

  static const keyDarkMode = 'key-darkmode';

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(_title)),
        body: SafeArea(
          child: ListView(
              padding: EdgeInsets.all(24),
              children: buildSettingsGroup()
          ),
        ));
  }

  buildSettingsGroup() {
    List<SettingsGroup> settings = [];

    var logout =  SettingsGroup(title: _all, children: [
      HeaderSettingsPage(),
      AccountSettingsPage(),
      //buildLogout(),
      buildLogout()]);

    settings.add(logout);

    return settings;
  }


  buildDarkMode() {
    return SwitchSettingsTile(
        settingKey: keyDarkMode,
        title: _darkMode,
        leading: IconWidget(color: Color(0xFF642ef3),icon: Icons.logout),
    onChange: (_) {},);
  }


  buildLogout() {
    return SimpleSettingsTile(title: _close,
      subtitle: "",
      leading: IconWidget(color: Colors.blue,icon: Icons.logout),
       onTap: (){ Settings.clearCache();});
  }


}







class HeaderSettingsPage extends StatelessWidget {
  static const keyDarkMod = 'key-darkMod';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
      //  buildHeader(),
        SizedBox(height: 32),
     //   buildUser(),
        buildDarkMode(),
      ],
    );
  }

  buildDarkMode() {
    return SwitchSettingsTile(
      settingKey: keyDarkMod,
      title: _darkMode,
      leading: IconWidget(color: Color(0xFF642ef3),icon: Icons.logout),
      onChange: (_) {},);
  }

}



class AccountSettingsPage extends StatelessWidget {

  static const keyLanguage = 'key-language';

  static const keyPassword = 'key-password';

  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return SimpleSettingsTile(title: _configAccount,
                              subtitle: _policySecurityLanguage,
                              leading: IconWidget(color: Colors.green,icon: Icons.person),
                              child: buildSettingsGroup());
  }


  SettingsGroup buildSettingsGroup() =>
      SettingsGroup(title: _configAccount,
                    children: [
                             //  buildLanguage(),
                               buildResetPassword(),
                               buildPrivacy(),
                               buildSecurity(),
                               buildAccountInfo()
                    ]);

  buildPrivacy() {

    return SimpleSettingsTile(title: _privacity,
        subtitle: "",
        leading: IconWidget(color: Colors.blue,icon: Icons.logout),
        onTap: (){});
  }

  buildSecurity() {

    return SimpleSettingsTile(title: _security,
        subtitle: "",
        leading: IconWidget(color: Colors.blue,icon: Icons.security),
        onTap: (){});
  }

  buildAccountInfo() {

    return SimpleSettingsTile(title: _info,
        subtitle: "",
        leading: IconWidget(color: Colors.blue,icon: Icons.info),
        onTap: (){});
  }

  buildResetPassword() {

    return TextInputSettingsTile(
        settingKey: keyPassword,
        title: _alterPassword,
        obscureText: true,
        validator: (password) => password != null ? null : "Preencha 6 caracteres");
  }

  buildLanguage() {
    return DropDownSettingsTile(
        settingKey: keyLanguage,
        subtitle: "Idioma",
        selected: 1,
        values: <int, String>{
          1: 'Portugues',
          2: 'English'
        });
    //    onChange: (language) {});
  }
}









class IconWidget extends StatelessWidget {
  final IconData icon;
  final Color color;

  const IconWidget({Key? key, required this.icon, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Icon(icon, color: Colors.white),
    );
  }
}
