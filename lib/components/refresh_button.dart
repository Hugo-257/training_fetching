// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:training_fetching/constants.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: kBackgroundColor,
      child: Icon(
        Icons.sync,
        size: 45.0,
        color: Colors.white,
      ),
      radius: 35,
    );
  }
}
