import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quick_dine/constants/constants.dart';
import 'package:quick_dine/models/orderItem.dart';
import 'package:quick_dine/widgets/expension_tiiles/entry.dart';
import 'package:quick_dine/widgets/expension_tiiles/entryItem.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  List<OrderItem> _cart = [];
  int _totalItems = 0;
  double _totalPrice = 0;
  final Entry data = Entry('Chicken', <Widget>[
    Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Image.network(
            'https://cdn-images-fishry.azureedge.net/product/Value-Bucket-f8d68d7-kfc.png/xs',
          ),
          title: Text('Friday Smoke Bucket'),
          subtitle: Text(
              'The perfect smokey break. 5 pieces of smokey chicken wings on friday'),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidStar,
              color: Constants().primaryColor,
              size: 13.0,
            ),
            Text(
              '4.5',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('99'),
            SizedBox(
              width: 20.0,
            ),
            Container(
              color: Constants().primaryColor,
              child: FlatButton(
                onPressed: () {
                  print('Add to Cart Button Pressed');
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Constants().secondaryColor),
                ),
              ),
            )
          ],
        ),
      ]),
    ),
    Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Image.network(
            'https://cdn-images-fishry.azureedge.net/product/Value-Bucket-f8d68d7-kfc.png/xs',
          ),
          title: Text('Friday Smoke Bucket'),
          subtitle: Text(
              'The perfect smokey break. 5 pieces of smokey chicken wings on friday'),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidStar,
              color: Constants().primaryColor,
              size: 13.0,
            ),
            Text(
              '4.5',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('99'),
            SizedBox(
              width: 20.0,
            ),
            Container(
              color: Constants().primaryColor,
              child: FlatButton(
                onPressed: () {
                  print('Add to Cart Button Pressed');
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Constants().secondaryColor),
                ),
              ),
            )
          ],
        ),
      ]),
    ),
  ]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: _buidBottomNavigation(),
        body: Builder(
          builder: (BuildContext context) => _buildBody(context),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 0,
          backgroundColor: Constants().primaryColor,
          child: Icon(
            FontAwesomeIcons.shoppingCart,
            color: Constants().secondaryColor,
          ),
          onPressed: () {
            print('FAB Pressed');
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) => _showShoppingCart());
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
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
          Expanded(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      print('Our Menu Pressed');
                      showDialog(
                        context: context,
                        child: Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Container(
                            height: 500,
                            child: ListView(
                              padding: EdgeInsets.only(top: 20.0),
                              children: <Widget>[
                                Text(
                                  'Menu',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 25.0,
                                  ),
                                ),
                                ..._listCategories(),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 70.0, right: 70.0),
                                  child: Container(
                                    height: 50.0,
                                    width: 50.0,
                                    color: Constants().primaryColor,
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Close'),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
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
                  height: 30.0,
                  width: 120.0,
                  child: Divider(
                    color: Constants().primaryColor,
                  ),
                ),
                Text(
                  'Previously Purchased',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _buildFoodItemCard(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Recomended Meals',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                _buildFoodItemCard(),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                EntryItem(data),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buidBottomNavigation() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Constants().primaryColor,
      child: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 30.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('$_totalItems Items Added To Cart'),
                Text(
                  'Total \$$_totalPrice',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                )
              ]),
        ),
      ),
    );
  }

  Card _buildFoodItemCard() {
    String _url =
        'https://cdn-images-fishry.azureedge.net/product/Value-Bucket-f8d68d7-kfc.png/xs';
    String _title = 'Friday Smoke Bucket';
    String _subTitle =
        'The perfect smokey break. 5 pieces of smokey chicken wings on friday';
    double _price = 99;
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Image.network(
            _url,
          ),
          title: Text(_title),
          subtitle: Text(_subTitle),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidStar,
              color: Constants().primaryColor,
              size: 13.0,
            ),
            Text(
              '4.5',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('$_price'),
            SizedBox(
              width: 20.0,
            ),
            Container(
              color: Constants().primaryColor,
              child: FlatButton(
                onPressed: () {
                  print('Add to Cart Button Pressed');
                  _updateCart(_url, _title, _subTitle, _price);
                },
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Constants().secondaryColor),
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }

  List<Widget> _listCategories() {
    return [
      FlatButton(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      FlatButton(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      FlatButton(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      FlatButton(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      FlatButton(
        padding: EdgeInsets.only(left: 40.0, right: 40.0, top: 20.0),
        onPressed: () {},
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Chicken',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ];
  }

  _buildShoppingCartItem(){
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Image.network(
            'https://cdn-images-fishry.azureedge.net/product/Value-Bucket-f8d68d7-kfc.png/xs',
          ),
          title: Text('Friday Smoke Bucket'),
          subtitle: Text(
              'The perfect smokey break. 5 pieces of smokey chicken wings on friday'),
        ),
        ButtonBar(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(
              FontAwesomeIcons.solidStar,
              color: Constants().primaryColor,
              size: 13.0,
            ),
            Text(
              '4.5',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('99'),
            SizedBox(
              width: 20.0,
            ),
            Container(
              height: 30.0,
              width: 30.0,
              color: Constants().primaryColor,
              child: FlatButton(
                onPressed: () {
                  print('- button pressed');
                },
                child: Text(
                  '-',
                  style: TextStyle(color: Constants().secondaryColor),
                ),
              ),
            ),
            Text('9'),
            Container(
              height: 30.0,
              width: 30.0,
              color: Constants().primaryColor,
              child: FlatButton(
                onPressed: () {
                  print('+ button pressed');
                },
                child: Text(
                  '+',
                  style: TextStyle(color: Constants().secondaryColor),
                ),
              ),
            )
          ],
        ),
      ]),
    );

  }

  _showShoppingCart(){
    return Container(
      color: Color(0xff757575),
      child: Container(
//        color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 5.0),
          child: ListView.builder(
            itemCount: _cart.length,
            itemBuilder: (BuildContext context, int index){
              return _buildShoppingCartItem();
            },
          ),
        ),
      ),
    );
  }

  _updateCart(String url, String title, String subTitle, double price) {
    setState(() {
      bool flag = false;
      OrderItem newItem = new OrderItem(1, url, title, subTitle, price, 1);
      _totalPrice = 0;
      _totalItems = _cart.length;
      _cart.forEach((item) {
        if (item.id == newItem.id) {
          item.quantity = item.quantity + newItem.quantity;
          _totalPrice = _totalPrice + item.price * item.quantity;
          flag = true;
        }
      });
      if (!flag) {
        _cart.add(newItem);
      }
    });
  }
}
