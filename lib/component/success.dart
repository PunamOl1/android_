import 'package:api/widget/subTitle.dart';
import 'package:api/constant.dart';

import 'package:flutter/material.dart';
import 'package:motion_toast/resources/colors.dart';

class Success extends StatefulWidget {
  Success({required Key key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Successful !!'),
          Title(
              color: Colors.black,
              child: Text('Your payment was done successfully')),
          ElevatedButton(
              onPressed: () {
                Image.asset(
                  "assets/images/success.gif",
                  fit: BoxFit.contain,
                );
              },
              child: Text("ok"))
        ],
      ),
    );
  }
}
