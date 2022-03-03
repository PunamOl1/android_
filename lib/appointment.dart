import 'package:flutter/material.dart';

import 'http/httpuser.dart';
import 'package:api/constant.dart';

class Appoitment extends StatefulWidget {
  const Appoitment({Key? key}) : super(key: key);

  @override
  _AppoitmentState createState() => _AppoitmentState();
}

class _AppoitmentState extends State<Appoitment> {
  final _formkey = GlobalKey<FormState>();
  String Name = '';
  String age = '';
  String email = '';
  String description = '';
  String date = '';

  Future Booking() async {
    print(age);
    var res = await HttpConnectUser().bookingPosts(
      Name,
      age,
      description,
      email,
      date,
    );
    return res;
  }

  String? checkEmpty(value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                const Text(
                  'Appointment Book',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF073738),
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    //controller: _medicineController,
                    onSaved: (value) {
                      Name = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your name',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF073738),
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    //controller: _medicineController,
                    onSaved: (value) {
                      age = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your age',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF073738),
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    //controller: _medicineController,
                    onSaved: (value) {
                      email = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter your email',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF073738),
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    //controller: _medicineController,
                    onSaved: (value) {
                      description = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Write description',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: kSecondary,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF073738),
                        blurRadius: 10,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    //controller: _medicineController,
                    onSaved: (value) {
                      date = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Include date',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      _formkey.currentState!.save();
                    });
                    Booking();
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
