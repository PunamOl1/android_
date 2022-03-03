import 'dart:async';
import 'dart:math';
import 'package:api/appointment.dart';
import 'package:api/component/drawer.dart';
import 'package:api/component/itemCard.dart';
import 'package:api/http/httpuser.dart';
import 'package:api/utilities/parseJWT.dart';
import 'package:api/wishlists.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:api/component/Reminder.dart';
//import 'package:medical_app/components/CategoryCard.dart';

//import 'package:medical_app/components/ProductCard.dart';
//import 'package:medical_app/constants.dart';
import 'package:api/component/productcard.dart';
import 'package:api/component/categorycard.dart';
import 'package:proximity_sensor/proximity_sensor.dart';

import 'package:flutter/foundation.dart' as foundation;

import 'package:api/constant.dart';
import 'package:api/model/Product.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:medical_app/models/Product.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var userData;

class _MyHomePageState extends State<MyHomePage> {
  Future token() async {
    // var data = await parseToken();
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(token);
    var jwt = Jwt.parseJwt(token!);
    // print(jwt);
    setState(() {
      userData = jwt;
    });
    // print(userData['user']);
    return jwt;
  }

  Future getProducts() {
    var res = HttpConnectUser().products();
    return res;
  }

  var wishlist = null;
  Future getCart() async {
    await userData;
    if (userData != null) {
      print("${userData['userId']}");
      var res = await HttpConnectUser().getCart(userData['userId']);
      // print(res);
      setState(() {
        wishlist = res['wishlist'];
      });
      // print("$wishlist listss");
    }
    // print(res);
  }

  // List<Product> products = [
  //   Product('Surgical Mask', "It is designed to prevent infections.",
  //       'assets/images/msk.PNG', 160),
  //   Product(
  //       'Black n95 Mask',
  //       "It is n95 mask designed to prevent infections in patients.",
  //       'assets/images/acyy.PNG',
  //       250),
  //   Product('Eye Patch', "It is designed to prevent infections in eyes.",
  //       'assets/images/sanit.PNG', 300),
  // ];
  bool _isNear = false;
  late StreamSubscription<dynamic> _streamSubscription;

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  int _currentIndex = 0;

  final tabs = [
    Center(child: Text("Home")),
    Center(child: Text("My Clinic")),
  ];

  @override
  void initState() {
    super.initState();
    getProducts();
    token();
    getCart();
  }

  Future<void> listenSensor() async {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (foundation.kDebugMode) {
        FlutterError.dumpErrorToConsole(details);
      }
    };
    _streamSubscription = ProximitySensor.events.listen((int event) {
      print(event);
      setState(() {
        _isNear = (event > 0) ? true : false;
        if (_isNear == true) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Appoitment(),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    logout() async {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.clear();
      final String? token = preferences.getString('token');
      print(token);

      Navigator.pushNamed(context, "/");
    }

    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Wishlsit(
                                user: userData!,
                              )));
                },
                icon: Icon(
                  Feather.shopping_cart,
                  color: kTextPrimary,
                  size: 20,
                ),
              ),
              Positioned(
                left: 8,
                top: 3,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 8,
                  child: Text(
                    wishlist != null ? "${wishlist.length}" : "0",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("punam"),
                accountEmail: Text("pnm@gmail.com")),
            ListTile(
              title: Text('Home'),
              subtitle: Text("homescreen"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text('About Us'),
              subtitle: Text("aboutus"),
              leading: Icon(Icons.work),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('privacy policy'),
              subtitle: Text("terms"),
              leading: Icon(Icons.privacy_tip),
              onTap: () {
                Navigator.pushNamed(context, '/privacypolicy');
              },
            ),
            ListTile(
              title: Text('Terms Of Services'),
              subtitle: Text("terms"),
              leading: Icon(Icons.medical_services),
              onTap: () {
                Navigator.pushNamed(context, '/servicesTerms');
              },
            ),
            ListTile(
              title: Text('Contact'),
              subtitle: Text("contact us"),
              leading: Icon(Icons.connect_without_contact),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: Text('Help'),
              subtitle: Text("help"),
              leading: Icon(Icons.help),
              onTap: () {
                print("policies");
              },
            ),
            ListTile(
              title: Text('FAQ'),
              subtitle: Text("faq here"),
              leading: Icon(Icons.format_quote),
              onTap: () {
                Navigator.pushNamed(context, '/faq');
              },
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout_outlined),
              onTap: () {
                logout();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            if (userData != null) ...[
              Text(
                'Hi! ${userData['user']['username']!}',
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
            SizedBox(height: 10),
            Text(
              'Services For You',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            Row(
              children: [
                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/appointment');
                        },
                        child: Text("Add Appointment")),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/userplans');
                        },
                        child: Text(
                          "Plans for Today",
                          style: TextStyle(),
                        )),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FlatButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 22),
                color: kSecondary,
                splashColor: kPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Feather.camera,
                      color: kTextPrimary,
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Upload your prescription',
                      style: TextStyle(
                        color: kTextPrimary,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Browse Medicines',
                  style: TextStyle(
                    color: kTextPrimary,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            FutureBuilder(
                future: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  return snapshot.hasData
                      ? Column(
                          children: [
                            Container(
                              // color: Colors.red,
                              height: MediaQuery.of(context).size.height * 0.24,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                children: [
                                  ItemCard(
                                      userId: userData['userId']!,
                                      product: snapshot.data[0]),
                                  ItemCard(
                                      userId: userData['userId']!,
                                      product: snapshot.data[5]),
                                  ItemCard(
                                      userId: userData['userId']!,
                                      product: snapshot.data[6]),
                                ],
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("Browse more...",
                                  style: TextStyle(color: Colors.blue)),
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
            SizedBox(height: 15),
            Text(
              "Today's deals",
              style: TextStyle(
                color: kTextPrimary,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 15),
            FutureBuilder(
                future: getProducts(),
                builder: (context, AsyncSnapshot snapshot) {
                  // print(snapshot.data[0]['pname']);
                  return snapshot.hasData
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) =>
                                ProductCard(product: snapshot.data[index]),
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondary,
        splashColor: kPrimary,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Reminder(),
            ),
          );
        },
        child: Icon(
          Icons.alarm_add,
          color: kTextPrimary,
          size: 30,
        ),
      ),
    );
  }
}
