import 'package:flutter/material.dart';

import '../constant.dart';

class StickyLabel extends StatelessWidget {
  final String text;
  final Color textColor;
  const StickyLabel({
    required Key key,
    required this.text,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20.0,
        ),
      ),
    );
  }
}
