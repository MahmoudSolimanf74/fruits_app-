import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/root.dart';
import 'package:fruits_app/features/auth/views/signup_with_phone.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';

class LoginPageViewmodel extends ChangeNotifier {
  void navigateToRoot(BuildContext context) {
    MyNavigator.goToReplacement(context, Root());
  }
  void navigatToSignupWithPhone(BuildContext context) {
    MyNavigator.goToReplacement(context, SignupWithPhone());
  }
}
