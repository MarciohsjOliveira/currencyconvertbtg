import 'package:flutter/material.dart';

//Classe do texto de boas vindas da home
class WelcomeText {
  textWelcome() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 100, 50, 5),
      child: RichText(
        text: TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: 'Olá, ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  fontFamily: 'Poppins',
                  color: Colors.white),
            ),
            TextSpan(
              text: '\nBem vindo ao conversor de moeda',
              style: TextStyle(
                  fontSize: 18, fontFamily: 'Poppins', color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
