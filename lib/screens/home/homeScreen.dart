import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_dine/screens/discounts/discountsScreen.dart';
import 'package:quick_dine/screens/my_orders/myOrdersScreen.dart';
import 'package:quick_dine/screens/popular_deals/popularDealsScree.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  int _currentTab = 1;
  TextEditingController _outputController;
  String _data = null;
  var _title = [
    'My Orders',
    'Popular Deals',
    'Discounts'
  ];
  var _tabs = [MyOrdersScreen(), PopularDealsScreen(), DiscountsScreen()];

  @override
  void initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildNavigationBar(context),
        body: _buildBody()
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.bars,
                size: 35.0,
              ),
            ],
          ),
          SizedBox(height: 30.0,),
          Text(
            _title[_currentTab],
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 25.0
            ),
          ),
          SizedBox(height: 20.0,),

          _tabs[_currentTab],
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: Color(0xffeccd35),
      initialSelection: _currentPage,
      inactiveIconColor: Colors.black,
      circleColor: Colors.black,
      tabs: [
        TabData(iconData: FontAwesomeIcons.utensils, title: 'My Orders'),
        TabData(
            iconData: FontAwesomeIcons.qrcode,
            title: 'Scan QR',
            onclick: () {
              _scanqr(context);
            }),
        TabData(iconData: FontAwesomeIcons.bell, title: 'Discounts')
      ],
      onTabChangedListener: (position) {
        setState(() {
          _currentPage = position;
          _currentTab = position;
        });
      },
    );
  }

  _scanqr(BuildContext context) async {
    // final result = Navigator.pushNamed(context, '/scanQR');
    // print('Homescreendata----$result');
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
      setState(() {
        _data = barcode;
      });

      print('QR Code -------> $_data');
    }
  }
}
