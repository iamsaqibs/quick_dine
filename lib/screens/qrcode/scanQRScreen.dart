import 'package:flutter/material.dart';
// import 'package:qrcode/qrcode.dart';

class ScanQRCodeScreen extends StatefulWidget {
  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {

  // QRCaptureController _captureController = QRCaptureController();

  // bool _isTorchOn = false;
  String _data;

  @override
  void initState() {
    super.initState();

    // _captureController.onCapture((data) {
    //   print('onCapture----$data');
    //   setState(() {
    //     _data = data;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    if(_data != null){
      Navigator.pop(context, _data);
    }
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            // QRCaptureView(controller: _captureController),
          ],
        ),
      ),
    );
  }
}
