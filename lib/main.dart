import 'package:flutter/material.dart';
import 'package:quick_dine/screens/home/homeScreen.dart';
import 'package:quick_dine/screens/qrcode/scanQRScreen.dart';
import 'package:quick_dine/screens/restaurant/restaurantScreen.dart';
void main(){
  runApp(MaterialApp(
    home: MyApp(),
    routes: {
      '/scanQR': (BuildContext context) => ScanQRCodeScreen(),
      '/restaurant': (BuildContext context) => RestaurantScreen(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffeccd35),
        child: Center(
          child: Text(
            'Quick Dine',
            style: TextStyle(
                color: Colors.black,
                fontSize: 40.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
