import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class BasketCard extends StatelessWidget {
  const BasketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 400,
        height: 115,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primarycolor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackcolor.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: [
              Image.asset("assets/6.png"),
              Gap(10),
              Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                children: [
                  CustomText(
                    title: "Prodact name",
                    size: 18,
                    fontWeights: FontWeight.bold,
                  ),
                  Row(
                    children: [
                      CustomText(title: "12.00\$", size: 14),
                      Gap(20),
                      CustomText(
                        title: "14.00\$",
                        size: 14,
                        color: AppColors.greycolor,
                        isDahed: true,
                      ),
                    ],
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.redcolor,
                    ),
                    child: CustomText(
                      title: "Up to 10% OFF",
                      size: 14,
                      color: AppColors.primarycolor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: .spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                    color: AppColors.redcolor,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColors.primarycolor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackcolor.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                        Text("4"),
                        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
