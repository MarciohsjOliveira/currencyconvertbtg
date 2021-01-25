import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/list_currency_repository.dart';
import 'package:currencyconvertbtg/app/components/usecases/list_currency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListCurrencyRepositoryMock extends Mock
    implements IListCurrencyRepository {}

final repository = ListCurrencyRepositoryMock();
final useCase = ListCurrency(repository);

main() {
  test("Deve retornar uma lista de moedas e seus nomes.", () async {
    when(repository.listCurrency())
        .thenAnswer((realInvocation) async => Right(List<Currency>()));
    final result = await useCase.listCurrency();
    expect(result | null, isA<List<Currency>>());
  });

  test("Deve retornar uma exceção do tipo ListError", () async {
    when(repository.listCurrency()).thenThrow(ListError());
    final result = await useCase.listCurrency();
    expect(result.fold(id, id), isA<ListError>());
  });
}
