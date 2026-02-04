import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';

class CustomText extends StatelessWidget {
  final String title;
  final double size;
  final FontWeight? fontWeights;
  final Color? color;

  const CustomText({
    super.key,
    required this.title,
    required this.size,
    this.fontWeights,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeights ?? FontWeight.normal,
        fontFamily: "Poppins",
        color: color ?? AppColors.blackcolor,
      ),
    );
  }
}
