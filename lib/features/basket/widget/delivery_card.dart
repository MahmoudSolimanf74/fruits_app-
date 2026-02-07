import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class DeliveryOptionCard extends StatelessWidget {
  final String title;
  final Widget content;
  final bool selected;
  final VoidCallback onTap;

  const DeliveryOptionCard({
    super.key,
    required this.title,
    required this.content,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primarycolor,
        boxShadow: [
          BoxShadow(
            color: AppColors.blackcolor.withValues(alpha: 0.3),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  title: title,
                  size: 18,
                  fontWeights: FontWeight.bold,
                ),
                const Gap(12),
                content,
              ],
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(),
                color: selected ? AppColors.secondarycolor : Colors.transparent,
              ),
              child: selected
                  ? Icon(Icons.check, size: 18, color: AppColors.primarycolor)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
