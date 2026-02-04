import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/views/otp_screen.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';

class SignupWithPhoneViewmodel extends ChangeNotifier {
  void navigattoOtpScreen(BuildContext context) {
    MyNavigator.goto(context, OtpScreen());
  }

  void goBack(BuildContext context) {
    MyNavigator.pop(context);
  }
}
