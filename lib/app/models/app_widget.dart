import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/list_currency_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

//Classe do MaterialApp e do Multiprovider, podendo assim
// escutar qualquer alteração na aplicação
class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ListCurrencyController>.value(
              value: ListCurrencyController()),
          ChangeNotifierProvider<ConvertCurrencyController>.value(
              value: ConvertCurrencyController()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: Modular.navigatorKey,
          title: "Currency Converter",
          initialRoute: Modular.initialRoute,
          onGenerateRoute: Modular.generateRoute,
        ));
  }
}
