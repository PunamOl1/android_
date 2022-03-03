import 'package:flutter/material.dart';

import '../constant.dart';

class SubTitle extends StatelessWidget {
  final String subTitleText;
  const SubTitle({
    required Key key,
    required this.subTitleText,
  }) : super(key: key);

  get kSubTextStyle => null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        subTitleText,
        textAlign: TextAlign.center,
        style: kSubTextStyle,
      ),
    );
  }
}
