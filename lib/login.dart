import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:api/constant.dart';

import 'http/httpuser.dart';
import 'dart:async';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  Future<bool> loginPost(String uname, String pass) async {
    var res = HttpConnectUser().loginPosts(username, password);
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 29,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 30),
                /* TextFormField(
                  onSaved: (value) {
                    username = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    hintText: 'Enter your username.',
                    border: OutlineInputBorder(),
                  ),
                ),*/
                Text(
                  'Username',
                  style: TextStyle(
                    color: kTextPrimary,
                    fontSize: 20,
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
                const SizedBox(height: 20),

                /*TextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
                  validator: checkEmpty,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'password',
                    hintText: 'Enter password',
                    border: OutlineInputBorder(),
                  ),
                ),*/

                Text(
                  'Password',
                  style: TextStyle(
                    color: kTextPrimary,
                    fontSize: 20,
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
                const SizedBox(height: 20),
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();

                          var res = await loginPost(username, password);
                          print(res);
                          if (res) {
                            Navigator.pushNamed(context, '/intro');
                          } else {
                            MotionToast.error(
                                    description: Text('Login UnSuccessfull'))
                                .show(context);
                          }
                          ;
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: kTextPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text(
                      'New User? Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
