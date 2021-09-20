import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/components/gridView/grid_view_component.dart';
import 'package:flutter_app/components/loading/component_progress.dart';
import 'package:flutter_app/components/message/component_centered_message.dart';
import 'package:flutter_app/http/helper/helper/webclient_helper.dart';
import 'package:flutter_app/http/webclients/payment/webclient_payment.dart';
import 'package:flutter_app/models/payments/dto/request/model_response_get_payments_entity.dart';
import 'package:flutter_app/router/factory/router_factory.dart';
import 'package:flutter_app/screens/configuration/screen_configuration.dart';


const _title = "Histórico de pagamentos";
const _buttonEdit = "Editar";

const _paymentOK = "Fatura paga";
const _paymentNOK = "Fatura pendente";

const primaryColor = Color(0xFF01579B);

class ScreenUserImagePayment extends StatefulWidget {

  int? _immobileId;

  ScreenUserImagePayment(this._immobileId);

  @override
  State<StatefulWidget> createState() {
    return ScreenUserImagePaymentState();
  }
}

class ScreenUserImagePaymentState extends State<ScreenUserImagePayment> {

  final httpHelper = WebClientHelper();
  final centeredMessageFactory = CenteredMessageFactory();
  final routerFactory = RouterFactory();


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseGetPaymentDetailEntity?>(
        initialData: ResponseGetPaymentDetailEntity(1, 1, []),
        future: WebClientPayment().getById(widget._immobileId!),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress(message: "Carregando");
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              if (httpHelper.existData(snapshot)) {

                ResponseGetPaymentDetailEntity? data = snapshot.data;

                return buildScaffold(data!.paymentsDetail!);
              }
          }
          return centeredMessageFactory.unknowError();
        });
  }

  buildScaffold(List<GetPaymentDetailEntity> paymentsDetail) =>
      Scaffold(appBar: AppBar(backgroundColor: primaryColor,title: Text(_title)),
               body: buildGridView(paymentsDetail),
               floatingActionButton: buildFloatingButton(context));


  buildGridView(List<GetPaymentDetailEntity> paymentsDetail) {

    List<AbstractItemGridView> itens = [];

    var textButton = TextButton(
      onPressed: (){ routerFactory.navigateTo(context, ScreenConfiguration()).then((value) => setState(() {}));},
      child: Text(_buttonEdit));

    paymentsDetail.forEach((element) {
        var status = element.status == "PENDING" ? _paymentNOK : _paymentOK;
        var item = AbstractItemGridView(description: status, title: "10/09/21", textButton: textButton, subTitle: "Valor: ${element.value}");
        itens.add(item);
     });

    return AbstractGridView(itens: itens);
  }


  FloatingActionButton buildFloatingButton(BuildContext context) {

    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () {
        routerFactory.navigateTo(context, ScreenConfiguration())
            .then((value) => setState(() {}));
      },
      child: Icon(Icons.add), //Icon(Icons.edit)
    );
  }
}