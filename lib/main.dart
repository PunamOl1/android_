import 'package:api/aboutUs.dart';
import 'package:api/addPatients.dart';
import 'package:api/addmedi.dart';
import 'package:api/appointment.dart';
import 'package:api/component/payment.dart';
import 'package:api/contactUs.dart';
import 'package:api/drawer.dart';
import 'package:api/faq.dart';
import 'package:api/homepage.dart';
import 'package:api/intro.dart';
import 'package:api/login.dart';
import 'package:api/privacyPolicy.dart';
import 'package:api/register.dart';
import 'package:api/termsOfServices.dart';
import 'package:api/usersplans.dart';
import 'package:api/wishlists.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  AwesomeNotifications().initialize(null, // icon for your app notification

      [
        NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: "Notification example",
            defaultColor: Color.fromARGB(255, 35, 105, 255),
            ledColor: Colors.white,
            playSound: true,
            enableLights: true,
            importance: NotificationImportance.High,
            enableVibration: true),
      ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  getToken() async {
    final prefs = await SharedPreferences.getInstance();

    final String? token = prefs.getString('token');
    print("$token");
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getToken(),
        builder: (context, AsyncSnapshot snapshot) {
          bool hastoken = snapshot.hasData;
          print(snapshot.data);
          return snapshot.hasData
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "okay",
                  initialRoute: '/',
                  routes: {
                      '/homepage': (context) => MyHomePage(),
                      //'/': (context) => Intro(),
                      '/': (context) => Login(),
                      '/register': (context) => Register(),
                      '/addmedi': (context) => Addmedi(),
                      '/about': (context) => AboutUs(),
                      '/intro': (context) => Intro(),
                      '/contact': (context) => ContactUs(),
                      '/faq': (context) => FaqPage(),
                      '/servicesTerms': (context) => TermsOfServices(),
                      '/privacypolicy': (context) => PrivacyPolicy(),
                      '/appointment': (context) => Appoitment(),
                      '/userplans': (context) => Todo(),
                      '/pay': (context) => PaymentDetails(),

                      // "/wishlist": (context) => Wishlsit()
                    })
              : Container(
                  child: Center(
                  child: CircularProgressIndicator(),
                ));
        });
  }
}
