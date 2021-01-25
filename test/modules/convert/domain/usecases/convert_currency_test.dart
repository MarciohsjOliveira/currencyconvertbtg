import 'package:currencyconvertbtg/app/components/currency_convert/convert.dart';
import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:currencyconvertbtg/app/components/errors/errors.dart';
import 'package:currencyconvertbtg/app/components/repositories/convert_currency_repository.dart';
import 'package:currencyconvertbtg/app/components/usecases/convert_currency.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ConvertCurrencyRepositoryMock extends Mock
    implements IConvertCurrencyRepository {}

final repository = ConvertCurrencyRepositoryMock();
final useCase = ConvertCurrency(repository);

final Currency from = new Currency(currency: "EUR", name: "Euro teste");
final Currency to = new Currency(currency: "BRL", name: "Real teste");

main() {
  test(
      "Deve retornar duas moedas e seus valores convertidos a partir do dolar.",
      () async {
    when(repository.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => Right(Convert()));
    final result = await useCase.convertCurrency(from, to);
    expect(result | null, isA<Convert>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async {
    when(repository.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => Right(Convert()));
    final result = await useCase.convertCurrency(null, to);
    expect(result.fold(id, id), isA<ConvertError>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async {
    when(repository.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => Right(Convert()));
    final result = await useCase.convertCurrency(from, null);
    expect(result.fold(id, id), isA<ConvertError>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async {
    when(repository.convertCurrency(any, any))
        .thenAnswer((realInvocation) async => Right(Convert()));
    final result = await useCase.convertCurrency(null, null);
    expect(result.fold(id, id), isA<ConvertError>());
  });

  test("Deve retornar uma exceção do tipo ConvertError", () async {
    when(repository.convertCurrency(any, any)).thenThrow(ConvertError());
    final result = await useCase.convertCurrency(from, to);
    expect(result.fold(id, id), isA<ConvertError>());
  });
}
