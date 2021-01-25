import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/list_currency_repository.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/list_currency_datasource.dart';
import 'package:dartz/dartz.dart';

class ListCurrencyRepository implements IListCurrencyRepository {
  final IListCurrencyDataSource dataSource;

  ListCurrencyRepository(this.dataSource);

  @override
  Future<Either<FailureCurrency, List<Currency>>> listCurrency() async {
    try {
      return Right(await dataSource.listCurrency());
    } on DataSourceError catch (Exception) {
      return Left(Exception);
    } catch (e) {
      return Left(DataSourceError(message: e.toString()));
    }
  }
}
