import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:fruits_app/utils/widgets/custom_text_field.dart';
import 'package:fruits_app/features/Home/views/root.dart';
import 'package:fruits_app/features/auth/views/signup_with_phone.dart';
import 'package:gap/gap.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              CustomText(
                title: "Fruit Market",
                size: 40,
                fontWeights: FontWeight.bold,
                color: AppColors.secondarycolor,
              ),
              Gap(20),
              CustomText(title: "Login to Wikala", size: 28),
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
                ontap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Root()),
                ),
              ),
              Gap(40),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    const TextSpan(text: "Already have an account? "),
                    TextSpan(
                      text: "Sign UP",
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignupWithPhone(),
                            ),
                          );
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
