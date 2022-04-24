// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:training_fetching/constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Text("Groot", style: kHeaderTitle),
            Text(
              "Your daily dose of humour",
              style: kHeaderSubtitle,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
    );
  }
}
//#ea6f79
