import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_dine/constants/constants.dart';
import 'package:quick_dine/screens/discounts/discountsScreen.dart';
import 'package:quick_dine/screens/my_orders/myOrdersScreen.dart';
import 'package:quick_dine/screens/popular_deals/popularDealsScree.dart';
import 'package:quick_dine/services/qrcodeService/qrcodeService.dart';

//import 'package:qrscan/qrscan.dart' as scanner;
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  int _currentTab = 1;
  TextEditingController _outputController;
  var _title = ['My Orders', 'Popular Deals', 'Discounts'];
  var _tabs = [MyOrdersScreen(), PopularDealsScreen(), DiscountsScreen()];

  @override
  void initState() {
    super.initState();
    this._outputController = new TextEditingController();
    if (this._outputController.text.isNotEmpty) {
      print(this._outputController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar:Builder(builder: (context) => _buildNavigationBar(context)) ,
          body: Builder(builder: (context) => _buildBody(context))),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: Constants().topBarPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                FontAwesomeIcons.bars,
                size: 35.0,
                color: Constants().primaryColor,
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            _title[_currentTab],
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0),
          ),
          SizedBox(
            height: 20.0,
          ),
          _tabs[_currentTab],
        ],
      ),
    );
  }

  Widget _buildNavigationBar(BuildContext context) {
    return FancyBottomNavigation(
      barBackgroundColor: Constants().primaryColor,
      initialSelection: _currentPage,
      inactiveIconColor: Constants().secondaryColor,
      circleColor: Constants().secondaryColor,
      tabs: [
        TabData(iconData: FontAwesomeIcons.utensils, title: 'My Orders'),
        TabData(
            iconData: FontAwesomeIcons.qrcode,
            title: 'Scan QR',
            onclick: () {
              QRCodeService().scanqr(context: context);
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
}
