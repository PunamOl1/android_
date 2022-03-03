import 'package:api/http/httpuser.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:api/constant.dart';

import 'model/user.dart';
import 'dart:async';

//http install for the post get every method for the request

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  String phone = '';
  String age = '';
  String address = '';

  Future<bool> registerUser(User u) {
    print("ok");
    var res = HttpConnectUser().registerPost(u);
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
                  'Personal Info for registration',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
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
                      username = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter username',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(height: 10),
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
                      password = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter password',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(height: 10),
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
                      phone = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter phone no.',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                SizedBox(height: 10),
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
                SizedBox(height: 10),
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
                      address = value!;
                    },
                    style: TextStyle(
                      color: kTextPrimary,
                    ),
                    validator: checkEmpty,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter address',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: const Size(double.infinity, 55),
                    ),
                    onPressed: () async {
                      print("It is pressed");
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        //User created in user.dart
                        bool isCreated = await registerUser(User(
                            username: username,
                            password: password,
                            phone: phone,
                            age: age,
                            address: address));
                        if (isCreated) {
                          MotionToast.success(
                            description: Text('Your account is registered.'),
                          ).show(context);
                        } else {
                          MotionToast.error(
                                  description: Text('failed to register'))
                              .show(context);
                        }
                      }
                    },
                    child: const Text('Register')),
                const SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    minimumSize: const Size(double.infinity, 55),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text('login now'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
