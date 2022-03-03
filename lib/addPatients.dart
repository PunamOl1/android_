import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({Key? key}) : super(key: key);

  @override
  _AddStudentScreenState createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _formkey = GlobalKey<FormState>();
  File? _image;

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  //method to open image from camera

  _imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
  }

//method to open image from gallery

  _imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
            child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                'Add Student Information',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    letterSpacing: 5.0),
              ),
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: _image == null
                      ? const AssetImage('images/profile_image.png')
                          as ImageProvider
                      : FileImage(_image!),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet());
                    },
                    child: const Icon(
                      Icons.upload,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose profile photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


//widget to build a bottomsheet for image

/*import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text("Health  server"),
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
      ),*/
    );
  }
}*/

