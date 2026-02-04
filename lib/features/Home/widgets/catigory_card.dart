import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';

class CatigoryCard extends StatelessWidget {
  const CatigoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 80,
        height: 80,
        margin: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackcolor.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(25),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset("assets/4.png"),
        ),
      ),
    );
  }
}
