import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/helpers/verify_connection_helper.dart';
import 'package:currencyconvertbtg/app/components/routes/app_routes.dart';
import 'package:currencyconvertbtg/app/components/usecases/list_currency.dart';
import 'package:currencyconvertbtg/app/models/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'convert_currency_controller.dart';

class ListCurrencyController extends ChangeNotifier {
  List<Currency> _currencyList = new List<Currency>();
  get currencyList => _currencyList;
  set currencyList(value) {
    _currencyList = value;
    notifyListeners();
  }

  String _failureCurrency = "";
  get failureCurrency => _failureCurrency;
  set failureCurrency(value) {
    _failureCurrency = value;
    notifyListeners();
  }

  Currency _selectedCurrency = new Currency();
  get selectedCurrency => _selectedCurrency;
  set selectedCurrency(value) {
    _selectedCurrency = value;
  }

  final ListCurrency useCase = Modular.get<ListCurrency>();

  Future getListCurrency() async {
    if (currencyList.length < 1)
      await useCase.listCurrency().then((value) => value.fold(
          (l) => failureCurrency = l.message, (r) => currencyList = r));
  }

  setCardTaped(int index) async {
    if (!this.currencyList[index].isTaped) {
      this.currencyList[index].isTaped = true;
      this.currencyList = this
          ._currencyList
          .where((element) =>
              element.currency == this.currencyList[index].currency)
          .toList();
      this.selectedCurrency = this.currencyList[0];
      notifyListeners();
    } else {
      this.selectedCurrency = null;
      this.currencyList.clear();
      this.getListCurrency();
    }
  }

  clear(TextEditingController textEditingController) {
    textEditingController.text = "";
    this.currencyList.clear();
    notifyListeners();
  }

  clearList() {
    this.currencyList.clear();
  }

  searchCurrency(String search) async {
    this.currencyList.clear();
    await this.getListCurrency();
    if (currencyList.length > 1)
      this.currencyList = this
          ._currencyList
          .where((element) => element.currency.startsWith(search.toUpperCase()))
          .toList();
  }

  backToHome() {
    Modular.to.pop();
  }

  Future getOriginCurrency() async {
    if (await VerifyConnection.verifyConnection() == true) {
      selectedCurrency = null;
      await targetNavigation("from");
    }
  }

  Future getDestinyCurrency() async {
    if (await VerifyConnection.verifyConnection() == true) {
      selectedCurrency = null;
      await targetNavigation("to");
    }
  }

  Future targetNavigation(String target) async {
    clearList();
    await getListCurrency();
    Modular.to.pushNamed(Routes.LISTCURRENCY, arguments: target);
  }

  confirmSelectedCurrency(
      String target, ConvertCurrencyController convertCurrencyController) {
    if (target == "from") {
      selectedCurrency == null
          ? CustomFlutterToast.alert("Selecione a moeda de origem")
          : convertCurrencyController.from = selectedCurrency;
    }
    if (target == "to") {
      selectedCurrency == null
          ? CustomFlutterToast.alert("Selecione a moeda de destino")
          : convertCurrencyController.to = selectedCurrency;
    }
    if (selectedCurrency != null) backToHome();
  }
}
