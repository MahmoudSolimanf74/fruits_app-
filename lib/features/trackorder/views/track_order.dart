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
  const TrackOrder({super.key,  this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            ...List.generate(4, (index) {
              return Column(
                children: [
                  Gap(10),
                  TrackOrderCard(
                    ontap: () => MyNavigator.goto(context, TrackingDetails()),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
