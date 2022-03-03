import 'package:api/component/myItems.dart';
import 'package:api/constant.dart';
import 'package:api/http/httpuser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Wishlsit extends StatefulWidget {
  const Wishlsit({Key? key, required this.user}) : super(key: key);
  final user;
  // final wishlist;
  @override
  State<Wishlsit> createState() => _WishlsitState();
}

class _WishlsitState extends State<Wishlsit> {
  logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
    final String? token = preferences.getString('token');
    print(token);

    Navigator.pushNamed(context, "/");
  }

  var wishlist = null;

  @override
  Widget build(BuildContext context) {
    Future getCart() async {
      // print("${widget.user['userId']}");
      var res = await HttpConnectUser().getCart(widget.user['userId']);
      // print(res);
      setState(() {
        wishlist = res['wishlist'];
      });
      // print(wishlist);
      // print("$wishlist listss");
    }

    getCart();
    // print(res);

    // print("asdasdwewqewdasdaw wishlist ${wishlist}");
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kPrimary,
        elevation: 0,
        // actions: [],
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
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                'My Cart',
                style: TextStyle(
                  color: kTextPrimary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: wishlist != null ? wishlist.length : 0,
                  itemBuilder: (context, index) {
                    return MyCard(
                        wishlistId: wishlist[index]['_id'],
                        userId: widget.user['userId']!,
                        product: wishlist[index]['product']);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
