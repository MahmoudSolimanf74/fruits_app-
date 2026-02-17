import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class FavCard extends StatelessWidget {
  final Function()? ontap;
  const FavCard({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    final double cardHeight = isLandscape ? 100 : 115;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
      child: Container(
        width: double.infinity,
        height: cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.primarycolor,
          boxShadow: [
            BoxShadow(
              color: AppColors.blackcolor.withValues(alpha: 0.3),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: isLandscape ? 60 : 70,
                height: isLandscape ? 60 : 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset("assets/6.png", fit: BoxFit.cover),
                ),
              ),
              const Gap(10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      title: "Prodact name",
                      size: 16,
                      fontWeights: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        const CustomText(title: "12.00\$", size: 14),
                        const Gap(12),
                        CustomText(
                          title: "14.00\$",
                          size: 13,
                          color: AppColors.greycolor,
                          isDahed: true,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.redcolor,
                      ),
                      child: CustomText(
                        title: "Up to 10% OFF",
                        size: 12,
                        color: AppColors.primarycolor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(4),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.cancel, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
