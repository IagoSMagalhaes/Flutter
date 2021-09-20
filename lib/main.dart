import 'package:flutter/material.dart';
import 'package:flutter_app/router/main/router_asset_config.dart';
import 'package:flutter_app/screens/configuration/screen_configuration.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:provider/provider.dart';




const primaryColor = const Color(0xFF01579B);



Future<void> main() async {
//  runApp(Boot());
  await Settings.init(cacheProvider: SharePreferenceCache());

  runApp(ChangeNotifierProvider(create: (BuildContext context)  =>  ThemeModel(),
                               child: Boot()));
           //                    child: Boot()));

  //WebClientAsset().findAllAssets();
}


class Boot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Settings.getValue<bool>(HeaderSettingsPage.keyDarkMod, true);

    return ValueChangeObserver<bool>(cacheKey: HeaderSettingsPage.keyDarkMod,
                              defaultValue: true,
                              builder: (_, isDarkMode, __) => MaterialApp(
                                  //darkTheme: ThemeData.dark(), // Provide dark theme.
                                  theme: isDarkMode ? ThemeData.dark() : ThemeData.light(), // Provide dark theme.
                                  initialRoute: "/home",
                                  routes: RouterAssetConfig().getRoutes()));

    return MaterialApp(
        darkTheme: ThemeData.dark(), // Provide dark theme.
        initialRoute: "/home",
        routes: RouterAssetConfig().getRoutes());
    /*
    return ChangeNotifierProvider<ThemeModel>(
      create: (_) => ThemeModel(),
      child: Consumer<ThemeModel>(
        builder: (_, model, __) {
          print("Testando saporra");
          return MaterialApp(
            theme: ThemeData.light(), // Provide light theme.
            darkTheme: ThemeData.dark(), // Provide dark theme.
            themeMode: model.mode, // Decides which theme to show.
            initialRoute: "/home",
            routes: RouterAssetConfig().getRoutes(),
          );
        },
      ),
    );
 */

  }




  buildTheme() {
      return ThemeData(
      backgroundColor: primaryColor,
      primaryColor: primaryColor,
      accentColor: Colors.blue[900],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blue[900],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}











/*   Example First Project
void main() => runApp(Boot());

class Boot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: ListaTransferencias());
  }
}


 */

/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


 */









class Configuration extends ChangeNotifier {

  int? themeColor;

  Configuration(this.themeColor);


  @override
  toString() {
    return themeColor.toString();
  }

  changeToRed() {
    this.themeColor = 0xFFB3E5FC;
    notifyListeners();
  }

  changeToBlue() {
    this.themeColor = 0xFF01579B;
    notifyListeners();
  }


}




class DashBoardTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ListView(children: [
              CardTheme(),
              Consumer<Configuration>(builder: (context, theme, child) {
                return ElevatedButton(
                    child: Text("Muda pra vermelho"),
                    onPressed: () {
                      theme.changeToRed();

                      // RouterFactory().navigateToScreenConfiguration(context);
                    });
              },
              ),
              Consumer<Configuration>(builder: (context, theme, child) {
                return ElevatedButton(
                    child: Text("Muda pra azul"),
                    onPressed: () {
                      theme.changeToBlue();
                      //  RouterFactory().navigateToScreenConfiguration(context);
                    });
              })
            ])
        ));
  }



}


class CardTheme extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Consumer<Configuration>(
              builder: (context, themeColor, child) {
                return Text(themeColor.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ));
              },
            )));
  }
}



class BytebankAppStateful extends StatefulWidget {

  int testeValorString = 0xFFB3E5FC;

  int testeValorString2 = 0xFF01579B;

  @override
  State<StatefulWidget> createState() {
    return BytebankAppStateState();
  }
}

class BytebankAppStateState extends State<BytebankAppStateful> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return buildApp();
  }

  buildApp() {

    return Consumer<Configuration>(builder: (context, themeColor, child){

      // testeValorString = themeColor.toString();
      // testeValor = int.tryParse(themeColor.toString());

      return MaterialApp(
        theme: buildThemeByteBank(int.tryParse(themeColor.toString())),
        home: buildTest(context),
      );
    });


  }

  ThemeData buildThemeByteBank(valor) {
    print("theme data");
    print(valor);


    Consumer teste2 = Consumer<Configuration>(builder: (context, themeColor, child){

      //widget.testeValorString = int.tryParse(themeColor.toString());'

      setState(() {
        widget.testeValorString = valor;
      });

      return Text(themeColor.toString());
    });

    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.green[valor],
      accentColor: Colors.blueAccent[valor],
      buttonTheme: ButtonThemeData(
        buttonColor: Colors.blueAccent[valor],
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }



  buildTest(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: Align(
            alignment: Alignment.topCenter,
            child: ListView(children: [
              CardTheme(),
              Consumer<Configuration>(builder: (context, theme, child) {
                return ElevatedButton(
                    child: Text("Muda pra vermelho"),
                    onPressed: () {
                      theme.changeToRed();
                      setState(() {
                        theme.changeToRed();
                        widget.testeValorString = 0xFFB3E5FC;
                      });
                      //  RouterFactory().navigateToScreenConfiguration(context);

                    });
              },
              ),
              Consumer<Configuration>(builder: (context, theme, child) {
                return ElevatedButton(
                    child: Text("Muda pra azul"),
                    onPressed: () {
                      theme.changeToBlue();
                      setState(() {
                        theme.changeToBlue();
                        widget.testeValorString = theme.changeToBlue();
                      });
                      //    RouterFactory().navigateToScreenConfiguration(context);
                    });
              })
            ])
        ));
  }

}