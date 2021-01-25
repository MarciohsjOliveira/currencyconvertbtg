import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/url_base/settings.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/convert_currency_datasource.dart';
import 'package:currencyconvertbtg/app/models/models_currency/convert_model.dart';
import 'package:dio/dio.dart';

class ConvertCurrencyDatasource implements IConvertCurrencyDataSource {
  final Dio dio;

  ConvertCurrencyDatasource(this.dio) : assert(dio != null);

  @override
  Future<ConvertModel> convertCurrency(Currency from, Currency to) async {
    final response = await dio.get(
        "${Settings.baseUrlPrefix}/live?access_key=${Settings.apiKey}&currencies=${from.currency},${to.currency}&source=USD&format=1");
    return response.statusCode == 200
        ? ConvertModel.toConvert(response.data['quotes'] as Map)
        : throw DataSourceError();
  }
}
