import 'package:flutter/material.dart';

abstract class MyNavigator {
  static void goto(BuildContext context, posotion) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => posotion));
  }

  static void goToReplacement(BuildContext context, posotion) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => posotion),
    );
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
