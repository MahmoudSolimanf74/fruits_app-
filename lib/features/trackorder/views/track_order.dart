import 'package:flutter/material.dart';
import 'package:fruits_app/features/trackorder/views/tracking_details.dart';
import 'package:fruits_app/features/trackorder/widgets/track_order_card.dart';
import 'package:fruits_app/utils/helper/my_navigator.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class TrackOrder extends StatelessWidget {
  final PersistentTabController? controller;
  const TrackOrder({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarycolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primarycolor,
        surfaceTintColor: Colors.transparent,
        title: CustomText(
          title: "My Orders",
          size: 24,
          fontWeights: FontWeight.bold,
          color: AppColors.secondarycolor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Column(
          children: [
            Divider(),
            Gap(20),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final orientation = MediaQuery.of(context).orientation;
                  const itemCount = 4;
                  if (orientation == Orientation.portrait) {
                    // رأسي: ليست عادية بفواصل ثابتة
                    return ListView.separated(
                      itemCount: itemCount,
                      separatorBuilder: (context, index) => const Gap(10),
                      itemBuilder: (context, index) {
                        return TrackOrderCard(
                          ontap: () => MyNavigator.goto(
                            context,
                            const TrackingDetails(),
                          ),
                        );
                      },
                    );
                  } else {
                    // أفقي: جريد بأبعاد مضبوطة تناسب الكارد
                    return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 5,
                          ),
                      itemCount: itemCount,
                      itemBuilder: (context, index) {
                        return TrackOrderCard(
                          ontap: () => MyNavigator.goto(
                            context,
                            const TrackingDetails(),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
