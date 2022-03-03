import 'package:flutter/material.dart';

import '../constant.dart';

class HeaderLabel extends StatelessWidget {
  final String headerText;
  const HeaderLabel({
    Key? key, required this.headerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        headerText,
        style: TextStyle(color: kSecondary, fontSize: 28.0),
      ),
    );
  }
}