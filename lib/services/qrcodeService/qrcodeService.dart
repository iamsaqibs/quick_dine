import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class QRCodeService {

  String codeData;

  scanqr({BuildContext context}) async {
    try {
      String barcode = await BarcodeScanner.scan();
      this.codeData = barcode;
      print('code data ------------ >>> $barcode');
      Navigator.pushNamed(context, '/restaurant');
    } catch (e) {
      print(e);
    }
  }
}