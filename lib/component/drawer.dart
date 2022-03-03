import 'package:api/constant.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';

//import 'bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//enum BottomIcons { Home, Favorite, Search, Account }

class _HomeScreenState extends State<HomeScreen> {
  //BottomIcons bottomIcons = BottomIcons.Home;

  int _currentIndex = 0;

  final tabs = [
    Center(child: Text("Home")),
    Center(child: Text("My Clinic")),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
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
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              child: SizedBox(
                height: 120,
                child: Image.asset(
                  "assets/images/doctors.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/appointment');
                  },
                  child: Text("Add Appointment"))
            ],
          ),
        ],
      ),

      /*body:tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        //selectedFontSize: 25,
        //unselectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_hospital),
              title: Text('My Clinic'),
              backgroundColor: Colors.green),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ) */
    );
  }
}
