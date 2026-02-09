import 'package:flutter/material.dart';
import 'package:fruits_app/features/Home/views/seller_products.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class SellerCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String state;
  final String product;
  final String? rate;
  final String? distance;
  const SellerCard({super.key, required this.name, required this.image, required this.description, required this.state, required this.product, this.rate, this.distance});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: () => MyNavigator.goto(context, SellerProducts()),
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
                Image.asset(image),
                Gap(10),
                Column(
                  mainAxisAlignment: .spaceEvenly,
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: name,
                          size: 18,
                          fontWeights: FontWeight.bold,
                        ),
                        Icon(Icons.star),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.motorcycle),
                        CustomText(
                          title: description ,
                          size: 14,
                        ),
                      ],
                    ),
                    Row(children: [Text(state), Gap(20), Text(product)]),
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: .spaceAround,
                  children: [Text(rate ?? ""), Text(distance ?? "2.5 KM")],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
