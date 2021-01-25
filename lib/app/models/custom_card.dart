import 'package:currencyconvertbtg/app/components/currency_convert/currency.dart';
import 'package:flutter/material.dart';

//Classe que define o card do resultado
class CurrencyCard extends StatefulWidget {
  CurrencyCard({@required this.currency, @required this.onTap});

  final Currency currency;
  final GestureTapCallback onTap;

  @override
  _CurrencyCardState createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          height: 100,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            border: Border.all(
                color: Color(0xFF2f2f39), width: 2, style: BorderStyle.solid),
            color: widget.currency.isTaped ? Color(0xFF2f2f39) : Colors.white,
            // color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.currency.currency,
                style: TextStyle(
                  fontSize: 25,
                  color: widget.currency.isTaped
                      ? Colors.white
                      : Color(0xFF2f2f39),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.currency.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.currency.isTaped
                          ? Colors.white
                          : Color(0xFF2f2f39),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
