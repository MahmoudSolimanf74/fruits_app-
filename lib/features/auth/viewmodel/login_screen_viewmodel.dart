import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/home_screen.dart';
import 'package:fruits_app/features/Home/views/root.dart';
import 'package:fruits_app/features/auth/views/login_page.dart';
import 'package:fruits_app/features/auth/views/signup_with_phone.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';

class LoginScreenViewmodel extends ChangeNotifier {
  void navigateToSignupWithPhone(BuildContext context) {
    MyNavigator.goto(context, SignupWithPhone());
  }

  void navigateToHomeScreen(BuildContext context) {
    MyNavigator.goToReplacement(context, HomeScreen());
  }

  void navigateToRoot(BuildContext context) {
    MyNavigator.goToReplacement(context, Root());
  }

  void navigateToLoginPage(BuildContext context) {
    MyNavigator.goto(context, LoginPage());
  }
}
