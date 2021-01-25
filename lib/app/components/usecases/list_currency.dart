import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/list_currency_repository.dart';
import 'package:dartz/dartz.dart';

abstract class IListCurrency {
  Future<Either<FailureCurrency, List<Currency>>> listCurrency();
}

class ListCurrency implements IListCurrency {
  final IListCurrencyRepository repository;

  ListCurrency(this.repository) : assert(repository != null);

  @override
  Future<Either<FailureCurrency, List<Currency>>> listCurrency() async {
    try {
      return await repository.listCurrency();
    } catch (e) {
      return Left(ListError(message: e.toString()));
    }
  }
}
