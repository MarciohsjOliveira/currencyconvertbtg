import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:flutter/material.dart';

// Classe que rebece  valores e os apresenta valores na tela principal
class ResultPannel extends StatefulWidget {
  final ConvertCurrencyController convertCurrencyController;

  ResultPannel({@required this.convertCurrencyController});
  @override
  _ResultPannelState createState() => _ResultPannelState();
}

class _ResultPannelState extends State<ResultPannel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              widget.convertCurrencyController.isLoading
                  ? CircularProgressIndicator()
                  : widget.convertCurrencyController.convert.from == null ||
                          widget.convertCurrencyController.convert.to == null
                      ? Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Resultado",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Origem:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    widget.convertCurrencyController.from
                                                .currency
                                                .toString() ==
                                            "null"
                                        ? ""
                                        : widget.convertCurrencyController.from
                                            .currency
                                            .toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Destino:",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    widget.convertCurrencyController.to.currency
                                                .toString() ==
                                            "null"
                                        ? ""
                                        : widget.convertCurrencyController.to
                                            .currency
                                            .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              widget.convertCurrencyController.to.currency
                                      .toString() +
                                  "  " +
                                  widget.convertCurrencyController.convertValue
                                      .toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
