import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/home_screen.dart';
import 'package:fruits_app/features/Home/views/root.dart';
import 'package:fruits_app/features/auth/views/login_page.dart';
import 'package:fruits_app/features/auth/views/login_screen.dart';
import 'package:fruits_app/features/auth/views/signup_with_phone.dart';
import 'package:fruits_app/features/auth/views/otp_screen.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';

class AuthNavigator {
  void toRoot(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const Root()),
      (route) => false,
    );
  }

  void toSignupWithPhone(BuildContext context) {
    MyNavigator.goto(context, SignupWithPhone());
  }

  void toLoginPage(BuildContext context) {
    MyNavigator.goto(context, LoginPage());
  }

  void toHomeScreen(BuildContext context) {
    MyNavigator.goToReplacement(context, HomeScreen());
  }

  void toOtpScreen(BuildContext context) {
    MyNavigator.goto(context, OtpScreen());
  }

  void toLoginScreen(BuildContext context) {
    MyNavigator.goto(context, LoginScreen());
  }

  void pop(BuildContext context) {
    MyNavigator.pop(context);
  }
}
