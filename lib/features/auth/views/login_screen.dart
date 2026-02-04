import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/viewmodel/login_screen_viewmodel.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_login_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';

import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewmodel = LoginScreenViewmodel();
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Gap(50),
            Row(
              mainAxisAlignment: .start,
              children: [
                GestureDetector(
                  onTap: () => viewmodel.navigateToRoot(context),
                  child: Icon(Icons.close),
                ),
              ],
            ),
            Gap(100),
            const CustomText(
              title: "Fruit Market",
              size: 40,
              color: AppColors.secondarycolor,
              fontWeights: FontWeight.bold,
            ),
            Gap(20),
            const CustomText(
              title: "Welcome to our App",
              size: 28,
              fontWeights: FontWeight.bold,
            ),
            Gap(20),
            CustomLoginButton(
              ontap: () => viewmodel.navigateToSignupWithPhone(context),
              text: "Sign in with Phone Number",
              icon: Icons.phone,
            ),
            Gap(20),
            CustomLoginButton(
              text: "Sign in with Google",
              icon: Icons.g_mobiledata_rounded,
            ),
            Gap(20),
            CustomLoginButton(
              text: "Sign in with Facebook",
              icon: Icons.facebook,
            ),
            Gap(80),
            Row(
              mainAxisAlignment: .center,
              children: [
                Text("Already member?"),
                TextButton(
                  onPressed: () {
                    viewmodel.navigateToLoginPage(context);
                  },
                  child: Text("Sign in "),
                ),
              ],
            ),
            Gap(50),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Colors.black),
                children: [
                  const TextSpan(text: "By continue you agree to our "),
                  TextSpan(
                    text: "Terms of service",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: " and our "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
