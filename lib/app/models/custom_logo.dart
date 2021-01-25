import 'package:flutter/material.dart';

//Classe que contem o logo da home
class LogoHome {
  logo() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(320, 200, 5, 5),
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomRight,
        child: Column(
          children: [
            Image.asset(
              'images/logo.png',
              width: 100,
              height: 100,
              scale: 1,
            ),
          ],
        ),
      ),
    );
  }
}
