import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/viewmodel/root_viewmodel.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class CheckOutConf extends StatelessWidget {
  const CheckOutConf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: .center,
              children: [
                Image.asset("assets/9.png"),
                CustomText(
                  title: "YOUR ORDER IS CONFIRMED!",
                  size: 24,
                  fontWeights: FontWeight.bold,
                  color: AppColors.secondarycolor,
                ),
                Gap(10),
                Text(
                  "Your order code: #243188 \n Thank you for choosing our products!",
                  textAlign: TextAlign.center,
                ),
                Gap(10),
                CustomButton(
                  text: "Continue Shopping",
                  width: double.infinity,
                  ontap: () {
                    MyNavigator.clean(context);
                    RootTabController.goToTab(0);
                  },
                ),
                Gap(20),
                CustomButton(
                  text: "Track Order",
                  color: AppColors.secondarycolor,
                  boxColor: AppColors.primarycolor,
                  width: double.infinity,
                  enableborder: true,
                  ontap: () {
                    MyNavigator.clean(context);
                    RootTabController.goToTab(1);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
