import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class DeliverySteps extends StatelessWidget {
  final String name;
  final String date;
  final bool isDone;
  const DeliverySteps({
    super.key,
    required this.name,
    required this.date,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: .start,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: .circle,
              border: Border.all(color: AppColors.secondarycolor),
              color: isDone ? AppColors.secondarycolor : AppColors.primarycolor,
            ),
            width: 30,
            height: 30,
          ),
          Gap(20),
          Column(
            crossAxisAlignment: .start,
            children: [
              CustomText(title: name, size: 18, fontWeights: FontWeight.bold),
              CustomText(title: date, size: 14),
            ],
          ),
        ],
      ),
    );
  }
}
