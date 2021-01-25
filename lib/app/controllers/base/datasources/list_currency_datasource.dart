import 'package:currencyconvertbtg/app/models/models_currency/currency_model.dart';

abstract class IListCurrencyDataSource {
  Future<List<CurrencyModel>> listCurrency();
}
