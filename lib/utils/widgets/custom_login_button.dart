import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class CustomLoginButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? ontap;
  const CustomLoginButton({super.key, required this.text, required this.icon, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greycolor),
          borderRadius: BorderRadius.circular(50),
          color: AppColors.primarycolor,
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            Icon(icon),
            Gap(10),
            CustomText(title: text, size: 18),
          ],
        ),
      ),
    );
  }
}
