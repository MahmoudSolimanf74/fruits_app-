import 'package:flutter/material.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class TrackOrderCard extends StatelessWidget {
  final Function()? ontap;
  const TrackOrderCard({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    // ارتفاع ثابت في الوضع الرأسي، ومرن في الجريد الأفقي (يأخذ ارتفاع الخلية)
    final double? cardHeight = isLandscape ? null : 110.0;
    final avatarSize = isLandscape ? 40.0 : 50.0;
    final actionSize = isLandscape ? 45.0 : 60.0;

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
        height: cardHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amberAccent.shade400,
                    ),
                    width: avatarSize,
                    height: avatarSize,
                    child: const Icon(Icons.fire_truck),
                  ),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomText(
                          title: "delivery ID",
                          size: 16,
                          fontWeights: FontWeight.bold,
                        ),
                        Gap(4),
                        CustomText(title: "9 spt . 4 items", size: 13),
                        Gap(4),
                        CustomText(
                          title: "Delivering",
                          size: 13,
                          color: Colors.amber,
                        ),
                      ],
                    ),
                  ),
                  const Gap(8),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.amberAccent.shade400,
                    ),
                    width: actionSize,
                    height: actionSize,
                    child: const Icon(
                      Icons.arrow_circle_right_outlined,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
