import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class IConvertCurrencyRepository {
  Future<Either<FailureCurrency, Convert>> convertCurrency(
      Currency from, Currency to);
}
