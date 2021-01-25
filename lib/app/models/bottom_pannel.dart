import 'package:currencyconvertbtg/app/components/enums/buttom_style.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/list_currency_controller.dart';
import 'package:flutter/material.dart';

import 'custom_buttom.dart';

//Classe dos botões de Origem, Destino e Converte e Limpar que estão na Home

class BottomPannel extends StatefulWidget {
  final TextEditingController valueController;
  final ConvertCurrencyController convertCurrencyController;
  final ListCurrencyController listCurrencyController;

  BottomPannel(
      {@required this.valueController,
      @required this.convertCurrencyController,
      @required this.listCurrencyController});

  @override
  _BottomPannelState createState() => _BottomPannelState();
}

class _BottomPannelState extends State<BottomPannel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          onPressed: () async =>
                              widget.listCurrencyController.getOriginCurrency(),
                          text: widget.convertCurrencyController.from
                                      .currency !=
                                  null
                              ? widget.convertCurrencyController.from.currency
                                  .toString()
                              : "Origem",
                          buttonStyle: CustomButtonStyle.Primary,
                        ),
                        CustomButton(
                          onPressed: () async => widget.listCurrencyController
                              .getDestinyCurrency(),
                          text: widget.convertCurrencyController.to.currency !=
                                  null
                              ? widget.convertCurrencyController.to.currency
                                  .toString()
                              : "Destino",
                          buttonStyle: CustomButtonStyle.Primary,
                        ),
                        CustomButton(
                          onPressed: () async => widget
                              .convertCurrencyController
                              .commitConvert(widget.valueController),
                          text: "Converter",
                          buttonStyle: CustomButtonStyle.Secondary,
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            child: CustomButton(
                              onPressed: () async => widget
                                  .convertCurrencyController
                                  .clearCurrencyConvertion(
                                      widget.valueController),
                              text: "Limpar",
                              buttonStyle: CustomButtonStyle.Primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
