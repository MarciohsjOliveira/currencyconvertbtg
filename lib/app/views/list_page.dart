import 'package:currencyconvertbtg/app/components/enums/buttom_style.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/convert_currency_controller.dart';
import 'package:currencyconvertbtg/app/controllers/controller_currency/list_currency_controller.dart';
import 'package:currencyconvertbtg/app/models/custom_buttom.dart';
import 'package:currencyconvertbtg/app/models/custom_card.dart';
import 'package:currencyconvertbtg/app/models/custom_textfield.dart';
import 'package:currencyconvertbtg/app/models/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPageView extends StatefulWidget {
  final String target;

  ListPageView({this.target});

  @override
  _ListPageViewState createState() => _ListPageViewState();
}

class _ListPageViewState extends State<ListPageView> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    ListCurrencyController listCurrencyController =
        Provider.of<ListCurrencyController>(context);
    ConvertCurrencyController convertCurrencyController =
        Provider.of<ConvertCurrencyController>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFd9d9d9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Escolha a moeda"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: Container(
                          child: CustomTextField(
                            keyboardType: TextInputType.text,
                            clearTap: () =>
                                listCurrencyController.clear(searchController),
                            controller: searchController,
                            onChanged: (search) =>
                                listCurrencyController.searchCurrency(search),
                            borderColor: Colors.blue,
                            hint: "Busca por sigla",
                          ),
                        ),
                      ),
                    ),
                    Consumer<ListCurrencyController>(
                      builder: (context, listCurrencyController, widget) {
                        if (listCurrencyController.failureCurrency != '') {
                          CustomFlutterToast.alert(
                              listCurrencyController.failureCurrency);
                          listCurrencyController.failureCurrency = '';
                        }
                        return listCurrencyController.currencyList.length < 1
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height / 1.7,
                                child:
                                    Center(child: CircularProgressIndicator()))
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  color: Colors.transparent,
                                  elevation: 0,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25)),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              1.7,
                                          child: ListView.separated(
                                              itemBuilder: (context, index) {
                                                return Center(
                                                    child: Padding(
                                                  padding: EdgeInsets.all(8),
                                                  child: CurrencyCard(
                                                    onTap: () =>
                                                        listCurrencyController
                                                            .setCardTaped(
                                                                index),
                                                    currency:
                                                        listCurrencyController
                                                                .currencyList[
                                                            index],
                                                  ),
                                                ));
                                              },
                                              separatorBuilder: (context,
                                                      index) =>
                                                  Divider(
                                                    height: 1,
                                                    color: Colors.transparent,
                                                  ),
                                              itemCount: listCurrencyController
                                                  .currencyList.length),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Card(
                        borderOnForeground: false,
                        color: Colors.transparent,
                        elevation: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.20,
                              height: 70,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CustomButton(
                                    onPressed: () =>
                                        listCurrencyController.backToHome(),
                                    text: "Voltar",
                                    buttonStyle: CustomButtonStyle.Secondary,
                                  ),
                                  CustomButton(
                                    onPressed: () => listCurrencyController
                                        .confirmSelectedCurrency(widget.target,
                                            convertCurrencyController),
                                    text: "Confirmar",
                                    buttonStyle: CustomButtonStyle.Primary,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
