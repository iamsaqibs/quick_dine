import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_dine/screens/discounts/discountsScreen.dart';
import 'package:quick_dine/screens/my_orders/myOrdersScreen.dart';
import 'package:quick_dine/screens/popular_deals/popularDealsScree.dart';
import 'package:quick_dine/screens/qrcode/scanQRScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPage = 1;
  int _currentTab = 1;
  var _tabs = [MyOrdersScreen(), PopularDealsScreen(), DiscountsScreen()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buildNavigationBar(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.bars,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://wikibio.in/wp-content/uploads/2019/07/Hindustani-Bhau.jpg'),
              ),
            ],
          ),
          _tabs[_currentTab],
        ],
      ),
    );
  }

  Widget _buildNavigationBar() {
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
              Navigator.pushNamed(context, '/scanQR');
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
