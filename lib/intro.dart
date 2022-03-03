// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:api/constant.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(
                      "Your Health",
                      style: TextStyle(
                          fontSize: 46,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Our Care",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Health care should be simple, fast\nuncomplicated.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                          wordSpacing: 4.0,
                          height: 1.5),
                    ),

                    // ignore: prefer_const_constructors
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/homepage');
                            },
                            child: Row(
                              children: [
                                Text(
                                  "Get Started",
                                  style: TextStyle(
                                    color: Colors.amberAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: SizedBox(
                  height: 120,
                  child: Image.asset(
                    "assets/images/doctors.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
