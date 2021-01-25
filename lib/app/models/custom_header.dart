import 'package:flutter/material.dart';

//Classe de decoração do heard da home
class CustomHeader {
  containerHead() {
    return Container(
      width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
          color: Color(0xFF2f2f39),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}
