import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/list_currency_controller.dart';
import 'package:currencyconvertbtg/app/models/bottom_pannel.dart';
import 'package:currencyconvertbtg/app/models/custom_header.dart';
import 'package:currencyconvertbtg/app/models/custom_logo.dart';
import 'package:currencyconvertbtg/app/models/custom_welcome.dart';
import 'package:currencyconvertbtg/app/models/result_pannel.dart';
import 'package:currencyconvertbtg/app/models/value_insert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final Currency from;
  final Currency to;
  final String target;

  Home({this.from, this.to, this.target});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with CustomHeader, WelcomeText, LogoHome {
  TextEditingController valueController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListCurrencyController listCurrencyController =
        Provider.of<ListCurrencyController>(context);
    ConvertCurrencyController convertCurrencyController =
        Provider.of<ConvertCurrencyController>(context);
    listCurrencyController.getListCurrency();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  containerHead(),
                  textWelcome(),
                  logo(),
                  Padding(
                    padding: const EdgeInsets.only(top: 300.0),
                    child: ValueInputPannel(
                        convertCurrencyController: convertCurrencyController,
                        valueController: valueController,
                        listCurrencyController: listCurrencyController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 380.0),
                    child: BottomPannel(
                        valueController: valueController,
                        convertCurrencyController: convertCurrencyController,
                        listCurrencyController: listCurrencyController),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 520.0),
                    child: ResultPannel(
                        convertCurrencyController: convertCurrencyController),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
