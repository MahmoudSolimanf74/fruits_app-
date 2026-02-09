import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class TrackOrderCard extends StatelessWidget {
  final Function()? ontap;
  const TrackOrderCard({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.primarycolor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackcolor.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        width: double.infinity,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: .circle,
                  color: Colors.amberAccent.shade400,
                ),
                width: 50,
                height: 50,
                child: Icon(Icons.fire_truck),
              ),
              Gap(20),
              Column(
                mainAxisAlignment: .center,
                children: [
                  CustomText(
                    title: "delivery ID",
                    size: 18,
                    fontWeights: FontWeight.bold,
                  ),
                  CustomText(title: "9 spt . 4 items", size: 14),
                  CustomText(
                    title: "Delivering",
                    size: 14,
                    color: Colors.amber,
                  ),
                ],
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: .circle,
                  color: Colors.amberAccent.shade400,
                ),
                width: 60,
                height: 60,
                child: Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 35,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
