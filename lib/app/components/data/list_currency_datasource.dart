import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/url_base/settings.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/list_currency_datasource.dart';
import 'package:currencyconvertbtg/app/models/models_currency/currency_model.dart';
import 'package:dio/dio.dart';

class ListCurrencyDatasource implements IListCurrencyDataSource {
  final Dio dio;

  ListCurrencyDatasource(this.dio) : assert(dio != null);

  @override
  Future<List<CurrencyModel>> listCurrency() async {
    final response = await dio
        .get("${Settings.baseUrlPrefix}/list?access_key=${Settings.apiKey}");
    return response.statusCode == 200
        ? CurrencyModel.toList(response.data['currencies'] as Map)
        : throw DataSourceError();
  }
}
