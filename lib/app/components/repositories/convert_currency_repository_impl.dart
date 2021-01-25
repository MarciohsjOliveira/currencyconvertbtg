import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/convert_currency_repository.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/convert_currency_datasource.dart';
import 'package:dartz/dartz.dart';

class ConvertCurrencyRepository implements IConvertCurrencyRepository {
  final IConvertCurrencyDataSource dataSource;

  ConvertCurrencyRepository(this.dataSource);

  @override
  Future<Either<FailureCurrency, Convert>> convertCurrency(
      Currency from, Currency to) async {
    try {
      return from == null
          ? Left(
              DataSourceError(message: "A moeda de origem não pode ser nula."))
          : to == null
              ? Left(DataSourceError(
                  message: "A moeda de destino não pode ser nula."))
              : Right(await dataSource.convertCurrency(from, to));
    } on DataSourceError catch (Exception) {
      return Left(Exception);
    } catch (e) {
      return Left(DataSourceError(message: e.toString()));
    }
  }
}
