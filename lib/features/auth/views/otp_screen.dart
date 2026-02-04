import 'package:flutter/material.dart';
import 'package:fruits_app/features/auth/viewmodel/auth_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_button.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authmodel = AuthNavigator();
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Gap(30),
              CustomText(
                title: "Fruit Market",
                size: 40,
                fontWeights: FontWeight.bold,
                color: AppColors.secondarycolor,
              ),
              const Gap(20),
              CustomText(title: "Enter Received OTP", size: 28),
              const Gap(40),

              PinCodeTextField(
                appContext: context,
                controller: otpController,
                length: 4, // 4 أرقام
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 60,
                  fieldWidth: 50,
                  activeFillColor: AppColors.primarycolor,
                  inactiveFillColor: Colors.grey[200]!,
                  selectedFillColor: Colors.white,
                  activeColor: AppColors.greycolor,
                  selectedColor: AppColors.secondarycolor,
                  inactiveColor: AppColors.greycolor,
                ),
                onChanged: (value) {},
                onCompleted: (value) {
                  // ViewModel
                },
              ),

              const Gap(40),
              CustomButton(
                text: "Confirm",
                width: double.infinity,
                ontap: () {
                  authmodel.toRoot(context);
                },
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
