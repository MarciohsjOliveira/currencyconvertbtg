import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/list_currency_controller.dart';
import 'package:flutter/material.dart';

import 'custom_textfield.dart';

class ValueInputPannel extends StatefulWidget {
  final TextEditingController valueController;
  final ConvertCurrencyController convertCurrencyController;
  final ListCurrencyController listCurrencyController;

  ValueInputPannel(
      {@required this.convertCurrencyController,
      @required this.valueController,
      @required this.listCurrencyController});
  @override
  _ValueInputPannelState createState() => _ValueInputPannelState();
}

//Classe para obter os dados digitados pelo usuario no campo
//de valor para ser convertido
class _ValueInputPannelState extends State<ValueInputPannel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          child: CustomTextField(
            clearTap: () =>
                widget.convertCurrencyController.clear(widget.valueController),
            controller: widget.valueController,
            onChanged: (search) =>
                widget.listCurrencyController.searchCurrency(search),
            borderColor: Colors.black12,
            keyboardType: TextInputType.number,
            hint: "Digite o valor",
          ),
        ),
      ),
    );
  }
}
