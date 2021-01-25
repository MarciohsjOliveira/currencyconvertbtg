import 'package:currencyconvertbtg/app/components/data/convert_currency_datasource.dart';
import 'package:currencyconvertbtg/app/components/data/list_currency_datasource.dart';
import 'package:currencyconvertbtg/app/components/repositories/convert_currency_repository_impl.dart';
import 'package:currencyconvertbtg/app/components/repositories/list_currency_repository_impl.dart';
import 'package:currencyconvertbtg/app/components/routes/app_routes.dart';
import 'package:currencyconvertbtg/app/components/usecases/convert_currency.dart';
import 'package:currencyconvertbtg/app/components/usecases/list_currency.dart';
import 'package:currencyconvertbtg/app/models/app_widget.dart';
import 'package:currencyconvertbtg/app/views/home_view.dart';
import 'package:currencyconvertbtg/app/views/list_page.dart';
import 'package:dio/dio.dart';
// ignore: implementation_imports
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModuleWidget extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ListCurrencyDatasource(i())),
        Bind((i) => ListCurrencyRepository(i())),
        Bind((i) => ListCurrency(i())),
        Bind((i) => ConvertCurrencyDatasource(i())),
        Bind((i) => ConvertCurrencyRepository(i())),
        Bind((i) => ConvertCurrency(i())),
      ];

  @override
  Widget get bootstrap => AppWidget();

  //Define as rotas de navegação
  @override
  List<ModularRouter> get routers => [
        ModularRouter(Routes.HOME,
            child: (context, args) => Home(),
            transition: TransitionType.fadeIn,
            duration: Duration(milliseconds: 200)),
        ModularRouter(Routes.LISTCURRENCY,
            child: (context, args) => ListPageView(
                  target: args.data,
                ),
            transition: TransitionType.rightToLeft,
            duration: Duration(milliseconds: 200)),
      ];
}
