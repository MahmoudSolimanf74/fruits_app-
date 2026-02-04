import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/viewmodel/auth_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:gap/gap.dart';

class SignupWithPhone extends StatelessWidget {
  SignupWithPhone({super.key});
  final authmodel = AuthNavigator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(30),
              CustomText(title: "Fruit Market", size: 40),
              Gap(20),
              CustomText(title: "Sign Up to Wikala", size: 28),
              Gap(40),
              CustomTextField(
                text: 'Full Name',
                hintText: "First and last name",
              ),
              Gap(40),
              CustomTextField(
                text: 'Phone Number with Whatsapp',
                hintText: 'mobile number',
              ),
              Gap(40),
              CustomTextField(text: 'Password', hintText: 'password'),
              Gap(40),
              CustomButton(
                text: "Sign Up",
                width: double.infinity,
                ontap: () => authmodel.toOtpScreen(context),
              ),
              Gap(40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          authmodel.pop(context);
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
