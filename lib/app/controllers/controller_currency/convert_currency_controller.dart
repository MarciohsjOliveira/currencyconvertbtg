import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/helpers/verify_connection_helper.dart';
import 'package:currencyconvertbtg/app/components/usecases/convert_currency.dart';
import 'package:currencyconvertbtg/app/models/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ConvertCurrencyController extends ChangeNotifier {
  ConvertCurrency useCase = Modular.get<ConvertCurrency>();

  String _failureConvert = "";
  get failureConvert => _failureConvert;
  set failureConvert(value) => _failureConvert = value;

  bool _isLoading = false;
  get isLoading => _isLoading;
  set isLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Currency _from = new Currency();
  get from => _from;
  set from(value) {
    _from = value;
    notifyListeners();
  }

  Currency _to = new Currency();
  get to => _to;
  set to(value) {
    _to = value;
    notifyListeners();
  }

  Convert _convert = new Convert();
  get convert => _convert;
  set convert(value) {
    _convert = value;
    notifyListeners();
  }

  double _convertValue = 0.0;
  get convertValue => _convertValue;
  set convertValue(value) {
    _convertValue = value;
    notifyListeners();
  }

  Future getCurrencyConvert() async =>
      await useCase.convertCurrency(this.from, this.to).then((value) =>
          value.fold((l) => failureConvert = l.message, (r) => convert = r));
  double getConvertValue(double value, double from, double to) =>
      ((value / from) * to);

  // ignore: missing_return
  Future<double> getConvert(TextEditingController value) async {
    isLoading = true;
    convertValue = 0.0;
    await getCurrencyConvert();
    convert.from.toString() == "null"
        ? isLoading = false
        : convertValue =
            getConvertValue(double.parse(value.text), convert.from, convert.to);
    isLoading = false;
  }

  commitConvert(TextEditingController valueController) async {
    if (await VerifyConnection.verifyConnection() == true) {
      if (from.currency == null || to.currency == null)
        CustomFlutterToast.alert("Selecione as moedas para conversão");
      else if (valueController.text == '')
        CustomFlutterToast.alert("Digite um valor para a conversão");
      else
        getConvert(valueController);
    }
  }

  clear(TextEditingController textEditingController) {
    textEditingController.text = "";
  }

  clearCurrencyConvertion(TextEditingController valueController) {
    isLoading = true;
    convert = new Convert();
    from = new Currency();
    to = new Currency();
    convertValue = 0.0;
    isLoading = false;
    valueController.text = "";
    notifyListeners();
  }
}
