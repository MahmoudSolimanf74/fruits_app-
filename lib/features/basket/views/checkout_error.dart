import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/root_viewmodel.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class CheckoutError extends StatelessWidget {
  const CheckoutError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Gap(100),
              Image.asset("assets/10.png"),
              Gap(20),
              CustomText(
                title: "OPS",
                size: 24,
                color: AppColors.redcolor,
                fontWeights: FontWeight.bold,
              ),
              Gap(10),
              Text("Error while confirming your payment/order"),
              Gap(30),
              CustomButton(
                text: "Back",
                boxColor: AppColors.redcolor,
                width: double.infinity,
                ontap: () {
                  MyNavigator.clean(context);
                  RootTabController.goToTab(0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
