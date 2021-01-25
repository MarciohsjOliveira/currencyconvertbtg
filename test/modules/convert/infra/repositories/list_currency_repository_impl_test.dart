import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/list_currency_repository_impl.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/list_currency_datasource.dart';
import 'package:currencyconvertbtg/app/models/models_currency/currency_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListCurrencyDataSourceMock extends Mock
    implements IListCurrencyDataSource {}

final dataSource = ListCurrencyDataSourceMock();
final repository = ListCurrencyRepository(dataSource);

main() {
  test("Deve retornar uma lista de moedas e seus nomes", () async {
    when(dataSource.listCurrency())
        .thenAnswer((realInvocation) async => List<CurrencyModel>());
    final result = await repository.listCurrency();
    expect(result | null, isA<List<Currency>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(dataSource.listCurrency()).thenThrow(DataSourceError());
    final result = await repository.listCurrency();
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
