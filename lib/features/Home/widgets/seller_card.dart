import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class SellerCard extends StatelessWidget {
  const SellerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 412,
        height: 105,
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
              Image.asset("assets/5.png"),
              Gap(10),
              Column(
                mainAxisAlignment: .spaceEvenly,
                crossAxisAlignment: .start,
                children: [
                  Row(
                    children: [
                      CustomText(
                        title: "Seller name",
                        size: 18,
                        fontWeights: FontWeight.bold,
                      ),
                      Icon(Icons.star),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.motorcycle),
                      CustomText(title: " Delivery Charges : 0.5 KD", size: 14),
                    ],
                  ),
                  Row(children: [Text("Open"), Gap(20), Text("Pizza")]),
                ],
              ),
              Spacer(),
              Column(
                mainAxisAlignment: .spaceAround,
                children: [Text("rate:4.5"), Text("2.5 KM")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
