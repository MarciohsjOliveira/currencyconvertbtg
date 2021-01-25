import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IListCurrencyRepository {
  Future<Either<FailureCurrency, List<Currency>>> listCurrency();
}
