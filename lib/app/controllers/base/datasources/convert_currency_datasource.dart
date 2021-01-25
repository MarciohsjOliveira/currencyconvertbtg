import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/models/models_currency/convert_model.dart';

abstract class IConvertCurrencyDataSource {
  Future<ConvertModel> convertCurrency(Currency from, Currency to);
}
