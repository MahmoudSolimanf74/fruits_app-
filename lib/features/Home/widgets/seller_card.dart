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
  const SellerCard({
    super.key,
    required this.name,
    required this.image,
    required this.description,
    required this.state,
    required this.product,
    this.rate,
    this.distance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: GestureDetector(
        onTap: () => MyNavigator.goto(context, SellerProducts()),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.primarycolor,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackcolor.withValues(alpha: 0.15),
                blurRadius: 4,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(image, fit: BoxFit.cover),
                  ),
                ),
                Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CustomText(
                              title: name,
                              size: 14,
                              fontWeights: FontWeight.bold,
                            ),
                          ),
                          Gap(4),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                        ],
                      ),
                      Gap(4),
                      Row(
                        children: [
                          Icon(Icons.motorcycle, size: 14),
                          Gap(4),
                          Expanded(
                            child: CustomText(title: description, size: 11),
                          ),
                        ],
                      ),
                      Gap(4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(state, style: TextStyle(fontSize: 11)),
                          ),
                          Gap(8),
                          Expanded(
                            child: Text(
                              product,
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap(6),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(rate ?? "", style: TextStyle(fontSize: 11)),
                    Gap(8),
                    Text(distance ?? "2.5 KM", style: TextStyle(fontSize: 11)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
