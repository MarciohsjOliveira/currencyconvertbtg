import 'dart:io';

import 'package:currencyconvertbtg/app/models/custom_toast.dart';

class VerifyConnection {
  // ignore: missing_return
  static Future<bool> verifyConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else
        return false;
    } on SocketException {
      CustomFlutterToast.alert("Verifique sua conexão");
    }
  }
}
