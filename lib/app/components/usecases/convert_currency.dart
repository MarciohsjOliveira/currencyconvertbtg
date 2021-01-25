import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/convert_currency_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IConvertCurrency {
  Future<Either<FailureCurrency, Convert>> convertCurrency(
      Currency from, Currency to);
}

class ConvertCurrency implements IConvertCurrency {
  final IConvertCurrencyRepository repository;

  ConvertCurrency(this.repository) : assert(repository != null);

  @override
  Future<Either<FailureCurrency, Convert>> convertCurrency(
      Currency from, Currency to) async {
    try {
      return from == null
          ? Left(ConvertError(message: "Moeda de origem não pode ser nula."))
          : to == null
              ? Left(
                  ConvertError(message: "Moeda de destino não pode ser nula."))
              : await repository.convertCurrency(from, to);
    } catch (e) {
      return Left(ConvertError(message: e.toString()));
    }
  }
}
