import 'package:flutter/material.dart';
import 'package:fruits_app/features/onboard/views/onboard_screen.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      // ignore: use_build_context_synchronously
      () => MyNavigator.goToReplacement(context, OnboardScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.secondarycolor,
        child: Column(
          mainAxisAlignment: .end,
          children: [Image.asset("assets/1.png")],
        ),
      ),
    );
  }
}
