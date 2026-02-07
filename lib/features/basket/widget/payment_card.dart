import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class PaymentCard extends StatelessWidget {
  final String image;
  final String title;
  final Function()? ontap;
  const PaymentCard({super.key, required this.image, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Image.asset(image),
            Gap(10),
            CustomText(title: title, size: 18),
            Spacer(),
            GestureDetector(
              onTap: ontap,
              child: Container(
                decoration: BoxDecoration(
                  shape: .circle,
                  border: Border.all(color: AppColors.greycolor),
                ),
                width: 25,
                height: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
