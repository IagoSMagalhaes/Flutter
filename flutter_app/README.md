# README



## Criando uma tela

## Criando um DTO

class RequestPostOwnerEntity {

  final String? name;
  final String? cellphone;
  
  RequestPostOwnerEntity(this.name, this.cellphone);

  factory RequestPostOwnerEntity.fromJson(Map<String, dynamic> json) => 
      RequestPostOwnerEntity(
        json['name'],
        json['cellphone']); 

  String toJson() {

    final Map<String, dynamic> assetMap = {'name': name, 'cellphone': cellphone};

    return jsonEncode(assetMap);
  }

}

## Criando um componente

class FieldInput extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  final String? hint;
  final IconData? icone;
  final double? padding;
  final TextInputType? keyboardType;

  const FieldInput({Key? key, this.controller, this.text, this.hint, this.icone, this.padding, this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: buildEdge(),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
            icon: icone != null ? Icon(icone) : null,
            labelText: text,
            hintText: hint),
        keyboardType: TextInputType.number,
      ),
    );
  }

  EdgeInsetsGeometry buildEdge() {

    if(padding != null)
      return EdgeInsets.all(padding!);

    return const EdgeInsets.all(16.0);
  }

  TextInputType? buildKeyBoard() {

    if(keyboardType != null)
      return keyboardType;

    return TextInputType.text;
  }
}

## Criando um componente baseado na resposta de uma chamada HTTP;
  class ButtonSelectedDomain extends StatefulWidget {

  String? defaultValue;

  final String hint;

  final String domain;

  ButtonSelectedDomain({Key? key, this.defaultValue, required this.hint, required this.domain}) : super(key: key);

  @override
  State<ButtonSelectedDomain> createState() => ButtonSelectedDomainState();
}

/// This is the private State class that goes with MyStatefulWidget.
class ButtonSelectedDomainState extends State<ButtonSelectedDomain> {

  final httpHelper = WebClientHelper();
  final centeredMessageFactory = CenteredMessageFactory();
  final routerFactory = RouterFactory();

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<String>>(
        initialData: [],
        future: WebClientDomain().getOptions(widget.domain),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:

              if(httpHelper.existData(snapshot)){
                List<String>? data = snapshot.data;
                
                return ButtonSelected(defaultValue: widget.defaultValue,
                                      options:  data!,
                                      hint: widget.hint);
              }
          }
          return centeredMessageFactory.unknowError();
        });
  }
}

## Criando uma tela

class ScreenOwnerForm extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ScreenOwnerFormState();
  }
}


class ScreenOwnerFormState extends State<ScreenOwnerForm> {

  final WebClientOwner _webClient = WebClientOwner();

  final TextEditingController _controllerFieldOwnerName = TextEditingController();

  final TextEditingController _controllerFieldOwnerCellphone =
      TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_title)),
      body: buildBody(),
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildInputName(),
          buildInputCellphone(),
          buildButtonPost()
        ],
      ),
    );
  }



  FieldInput buildInputName() {
    return FieldInput(
      controller: _controllerFieldOwnerName,
      text: _fieldTextOwnerName
    );
  }

  FieldInput buildInputCellphone() {
    return FieldInput(
      controller: _controllerFieldOwnerCellphone,
      text: _fieldTextOwnerCellphone,
      hint: _fieldHintOwnerCellphone,
    );
  }

  ElevatedButton buildButtonPost() {
    return ElevatedButton(onPressed: () => buildActionOnPressed(),
        child: Text(_textButton));
  }

  Future<dynamic> buildActionOnPressed() {
    return showDialog(context: context, builder: (contextDialog){
      return AuthDialog(onConfirm: (String password)  =>
          _postOwner(context, password));
  });
  }



  Future<void> _postOwner(BuildContext context, String password) async {

    //validatorPostOwner()
    if (_controllerFieldOwnerName.value != null) {

        final body = buildOwner().toPost();

        _webClient.post(body, password, context)
                        .then((httpResponse) {

          if(httpResponse.statusCode == 200){
            SuccessDialog().showDialogSuccess(context, _textSuccessPost);
          } else {
            ApiError apiError = ApiError.fromJson(json.decode(httpResponse.body));
            FailureDialog(message: apiError.message!).showDialogErrorMessage(context);
          }
        });
        }
    }

  Owner buildOwner() => Owner(null, _controllerFieldOwnerName.text, _controllerFieldOwnerCellphone.text);
  
}
  
## Criando um dashboard

class Dashboard extends StatelessWidget {

  final RouterFactory _routerFactory = RouterFactory();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: primaryColor,
          title: Text('Asset Management'),
        ),
       // backgroundColor: backGroundColor,
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



  buildBody()  {

    return Container(
      child: Padding(
        padding: const EdgeInsets.all(120.0),
        child: Image.asset('images/logo.gif'),
        //child: Image.asset('images/logo_teste.gif', height: 250, width:  250)
      ),
    );
  }



  buildFooter(context) => Container(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
        children: [
          buildOwner(context),
          buildSearch(context),
          buildPost(context),
          buildVehicles(context),
          buildImmobile(context),
        ]),
  );


  buildOwner(context) => ItemDashboard(name: "Contatos",
      icon: _iconScreenOwnerList(),
      onClick: () => _routerFactory.navigateToScreenOwnerList(context));


  buildSearch(context) => ItemDashboard(name: "Buscar Patrimônios",
                                                      icon: _iconScreenAssetList(),
                                                      onClick: () => _routerFactory.navigateToScreenAssetList(context));


  buildPost(context) => ItemDashboard(name: "Novo Patrimônio",
                                      icon: _iconScreenAssetFormPost(),
                                      onClick: () => _routerFactory.navigateToScreenAssetFormPost(context));


  buildImmobile(context) => ItemDashboard(name: "Imóveis",
      icon: _iconScreenImmobileList(),
      onClick: () => _routerFactory.navigateToScreenImmobileList(context));


  buildVehicles(context) => ItemDashboard(name: "Veículos",
      icon: _iconScreenVehiclesList(),
      onClick: () => _routerFactory.navigateToScreenVehicleList(context));

}
  
## Incluindo Roteamento app

class RouterAssetConfig {

  String get initialRoute => '/home';

  Map<String, WidgetBuilder> getRoutes() {
    return <String, WidgetBuilder> {
      '/home': (BuildContext context) =>  Dashboard(),
      '/post/asset': (BuildContext context) => ScreenAssetForm(),
      '/post/owner': (BuildContext context) => ScreenOwnerForm(),
    };
  }
}

## Direcionar para outra tela

  Future<void> navigateTo(context, StatefulWidget statefulWidget) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => statefulWidget));

## Exibindo um loading durante a chamada

## Exibindo um dialog para o usuario

## Realizando uma requisição HTTP;

### GET/POST
class WebClientVehicles extends AbstractWebClient{

  final _urlVehicle = "vehicle/v1";

  Future<List<ResponseGetVehicleEntity>> findAll() async {

    final httpResponse = await client.get(Uri.parse(localhostBaseUrl + _urlVehicle)).timeout(Duration(seconds: 15));

    List<ResponseGetVehicleEntity> responseMethod = [];

    if (httpResponse.statusCode == 200) {

      List<dynamic> datas = json.decode(httpResponse.body);

      List<ResponseGetVehicleEntity> assets = [];

      datas.forEach((element) => assets.add(ResponseGetVehicleEntity.fromJson(element)));

      responseMethod = assets;

      return responseMethod;

    } else {
      return [];
    }
  }

  Future<void> post(List<RequestPostVehicleEntity> vehicles, String password) async {

    vehicles.forEach((vehicle) async {

      final String body = vehicle.toJson();

      final httpResponse = await client.post(Uri.parse(localhostBaseUrl + _urlVehicle),
          headers:  buildHeader(password),
          body: body)
          .timeout(Duration(seconds: 15));

      if(httpResponse.statusCode == 200){
        return;
      } else {
        genericThrowHttpError(httpResponse.statusCode);
      }

    });
  }
}
## Incluir Interceptor
  
Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
  
class LoggingInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print("Request");
    print("url: ${data.url}");
    print("headers: ${data.headers}");
    print("body: ${data.body}");
   return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print("Response");
    print("status code: ${data.statusCode}");
    print("body: ${data.body}");
    return data;
  }
  
}

##Tratando erros HTTP
  
  client.post(Uri.parse(localhostBaseUrlV1),
                       headers:  buildHeader(password),
                       body: body)
                       .catchError((e) {FailureDialog(message: e.toString()).showDialogError(context, e);
                   }, test: (e) => e is HttpException)
                       .catchError((e) {FailureDialog(message: e.toString()).showDialogError(context, e);
                   }, test: (e) => e is TimeoutException)
                       .catchError((e) => FailureDialog().showUnknowError(context))
                       .timeout(Duration(seconds: 15));

## Inserindo autorização no evento
  
  
class AuthDialog extends StatefulWidget {

  final Function(String password) onConfirm;

  AuthDialog({required this.onConfirm});

  @override
  State<AuthDialog> createState() => _AuthDialogState();
}



class _AuthDialogState extends State<AuthDialog> {

  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: buildTitle(),
        content: buildContent(),
      actions: [
        buildButtonConfirm(),
        buildButtonCancel(),
      ],
    );
  }

  TextField buildContent() => TextField(
    controller: _passwordController,
    obscureText: true, // Esconder
    maxLength: 4,
    decoration: InputDecoration(   //BORDA
      border: OutlineInputBorder()
    ),
    textAlign: TextAlign.center,
    keyboardType: TextInputType.number,
    style: TextStyle(fontSize: 52, letterSpacing: 24));
  Text buildTitle() => Text("Autenticação");

  FlatButton buildButtonConfirm() => FlatButton(onPressed: () {
    widget.onConfirm(_passwordController.text);
    Navigator.pop(context);
    }, child: Text("Confirmar"),);

  FlatButton buildButtonCancel() => FlatButton(onPressed: () => Navigator.pop(context), child: Text("Cancelar"),);
}



  Future<dynamic> buildActionOnPressed() {
      return showDialog(context: context, builder: (contextDialog) { // Tomar cuidado quando trocar de contexto
        return AuthDialog(onConfirm: (String password) =>
            _postImmobile(context, password));
      });
    }
