import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_dine/constants/constants.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buidBottomNavigation(),
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Constants().primaryColor,
          child: Icon(
            FontAwesomeIcons.shoppingCart,
            color: Constants().secondaryColor,
          ),
          onPressed: (){
            print('FAB Pressed');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: Constants().topBarPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.bars,
                  size: 35.0,
                  color: Constants().primaryColor,
                ),
                Row(children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print('Search Button Tapped');
                    },
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Constants().primaryColor,
                      child: Icon(
                        FontAwesomeIcons.search,
                        color: Constants().secondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  GestureDetector(
                    onTap: () {
                      print('Filter Button Tapped');
                    },
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Constants().primaryColor,
                      child: Icon(
                        FontAwesomeIcons.filter,
                        color: Constants().secondaryColor,
                      ),
                    ),
                  )
                ])
              ]),
          SizedBox(
            height: 20.0,
          ),
          Image.network(
            'https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png',
            height: 50.0,
            width: 50.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 50.0,
            child: FlatButton(
              onPressed: () {
                print('Our Menu Pressed');
              },
              child: Text(
                'Our Menu',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              color: Constants().primaryColor,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Image.network(
            'https://resources.stuff.co.nz/content/dam/images/1/d/n/e/j/k/image.related.StuffLandscapeSixteenByNine.710x400.1dnee9.png/1481675159935.jpg',
          ),
          SizedBox(
            height: 50.0,
            width: 120.0,
            child: Divider(
              color: Constants().primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidBottomNavigation(){
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Constants().primaryColor,
      child: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text(
                'Two Items Added To Cart'
              ),

              Text(
                'Total 100',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0
                ),
              )
            ] 
          ),
        ),
      ),
    );
  }
}
