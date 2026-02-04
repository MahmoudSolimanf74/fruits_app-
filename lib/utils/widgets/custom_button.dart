import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? width;
  final Color? color;
  final Function()? ontap;

  const CustomButton({
    super.key,
    required this.text,
    this.width,
    this.color,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondarycolor,
          borderRadius: BorderRadius.circular(50),
        ),
        width: width ?? 177,
        height: 50,
        child: Center(
          child: CustomText(
            title: text,
            size: 16,
            fontWeights: FontWeight.bold,
            color: color ?? AppColors.primarycolor,
          ),
        ),
      ),
    );
  }
}
