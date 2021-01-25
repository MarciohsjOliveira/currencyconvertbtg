import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/convert_currency_repository_impl.dart';
import 'package:currencyconvertbtg/app/controllers/base/datasources/convert_currency_datasource.dart';
import 'package:currencyconvertbtg/app/models/models_currency/convert_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConvertCurrencyDataSourceMock extends Mock
    implements IConvertCurrencyDataSource {}

final dataSource = ConvertCurrencyDataSourceMock();
final repository = ConvertCurrencyRepository(dataSource);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main() {
  test("Deve retornar um modelo de conversão com 2 moedas a partir do dolar",
      () async {
    when(dataSource.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(from, to);
    expect(result | null, isA<Convert>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(dataSource.convertCurrency(any, any)).thenThrow(DataSourceError());
    final result = await repository.convertCurrency(from, to);
    expect(result.fold(id, id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(dataSource.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(null, to);
    expect(result.fold(id, id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(dataSource.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(from, null);
    expect(result.fold(id, id), isA<DataSourceError>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(dataSource.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => ConvertModel());
    final result = await repository.convertCurrency(null, null);
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
