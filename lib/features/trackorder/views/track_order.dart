import 'package:flutter/material.dart';
import 'package:fruits_app/features/trackorder/widgets/track_order_card.dart';
import 'package:fruits_app/utils/theme/app_colors.dart';
import 'package:fruits_app/utils/widgets/custom_text.dart';
import 'package:gap/gap.dart';

class TrackOrder extends StatelessWidget {
  const TrackOrder({super.key});

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
              return Column(children: [Gap(10), TrackOrderCard()]);
            }),
          ],
        ),
      ),
    );
  }
}
